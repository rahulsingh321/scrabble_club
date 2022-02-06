class Match < ApplicationRecord
  belongs_to :game
  has_many :participants, dependent: :destroy

  accepts_nested_attributes_for :participants, allow_destroy: true
end
