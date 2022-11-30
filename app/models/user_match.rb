class UserMatch < ApplicationRecord
  belongs_to :match
  belongs_to :user

  validates :score, presence: true
end
