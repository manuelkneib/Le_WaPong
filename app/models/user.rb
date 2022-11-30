class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_leagues, dependent: :destroy
  has_many :user_matches, dependent: :destroy
  has_many :leagues, through: :user_leagues
  has_many :leagues, foreign_key: "creator_id", class_name: "League", dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :password, presence: true, length: { minimum: 6 }
end
