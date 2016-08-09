class Movie < ActiveRecord::Base
  has_many :users
  before_save {self.title = title.downcase if title}
  before_save {self.genre = genre.downcase if genre}
  before_save {self.actors = actors.downcase if actors}
end
