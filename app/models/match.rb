class Match < ApplicationRecord
  belongs_to :league
  belongs_to :player1, class_name: "User", foreign_key: "player1_id"
  belongs_to :player2, class_name: "User", foreign_key: "player2_id"
  belongs_to :winner, class_name: "User", foreign_key: "winner_id", optional: true

  has_many :user_matches, dependent: :destroy
end
