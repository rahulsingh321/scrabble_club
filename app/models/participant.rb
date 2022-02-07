class Participant < ApplicationRecord
  validates :score, presence: true

  belongs_to :player
  belongs_to :match
  belongs_to :game
end
