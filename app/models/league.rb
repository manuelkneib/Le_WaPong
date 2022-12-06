class League < ApplicationRecord
  has_many :user_leagues, dependent: :destroy
  has_many :users, through: :user_leagues
  has_many :matches, dependent: :destroy
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"

  validates :name, presence: true
  validates :sport, presence: true
end
