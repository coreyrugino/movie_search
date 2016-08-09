class User < ActiveRecord::Base
  has_many :movies
  validates :email, uniqueness: true
end
