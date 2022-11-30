class UserLeague < ApplicationRecord
  belongs_to :league
  belongs_to :user

  validates :user, uniqueness: { scope: :league }
  validates :points, presence: true
end
