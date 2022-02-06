class Participant < ApplicationRecord
  belongs_to :player
  belongs_to :match
  belongs_to :game
end
