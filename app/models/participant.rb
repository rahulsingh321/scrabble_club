class Participant < ApplicationRecord
  validates :score, presence: true
  validates :player, uniqueness: { scope: :game }

  belongs_to :player
  belongs_to :match
  belongs_to :game
end
