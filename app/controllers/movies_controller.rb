class MoviesController < ApplicationController
  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to user_path(@movie.user_id)
    else
      render :new
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to users_path(@movie.user_id)
  end

  private
    def movie_params
      params.require(:movie).permit(:title, :user_id, :genre, :actors)
    end

end
