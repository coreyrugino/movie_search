class UsersController < ApplicationController

  def index
    @users = User.all
    # binding.pry
  end

  # Heart of the site, where users search for movies, show movies the uploaded and movies they liked
  def show
    @user = User.find(params[:id])
    if params[:search]
      search = params[:search]
      @heading = "Search results"
      @movies = Movie.where('title LIKE :search OR genre LIKE :search or actors Like :search', search: "%#{search}%")
    else
      whichone()
    end
    @likes = Movie.where(id: @user.likes)
  end

  # seeing if you have any uploaded movies in the database
  def whichone
    @heading = "Movies You Uploaded"
    upmovies = Movie.where(user_id: @user.id)
    # binding.pry
    if upmovies.any?
      @movies = upmovies
    else
      # binding.pry
      @heading = "No Movies Uploaded."
      @movies = upmovies
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save

      redirect_to users_path
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  # how a movie is added to your own list of liked movies.
  def add_movie_to_likes
    @user = User.find(params[:user_id])
    # checking to see if the movie is in the database already
    # binding.pry
    @user.likes ||= []
    if @user.likes.include? params[:movie_id]
      flash[:notice] = "already in your list"
    else
      @user.likes.push(params[:movie_id])
      @user.save
    end
    redirect_to user_path(@user)
  end

  # how to remove a movie that was liked
  def remove_movie_from_likes
    @user = User.find(params[:user_id])
    binding.pry
    @user.likes.delete(params[:id])
    @user.save
    redirect_to user_path(@user)
  end

  private
      def user_params
        params.require(:user).permit(:name, :email)
      end
end
