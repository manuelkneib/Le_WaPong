class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_leagues
  has_many :user_matches
  has_many :leagues, foreign_key: "creator_id", class_name: "League"
end
