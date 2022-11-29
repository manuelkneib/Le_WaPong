class UserMatch < ApplicationRecord
  belongs_to :match
  belongs_to :user

  validates :match_id, presence: true
  validates :user_id, presence: true
  validates :score, presence: true
end
