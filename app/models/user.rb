class User < ApplicationRecord
  validates_presence_of :name, :email, :bio, :city, :username
  validates_uniqueness_of :email, :username

  enum template: {
    dark: 0,
    red: 1,
    blue: 2,
    green: 3
  }
end
