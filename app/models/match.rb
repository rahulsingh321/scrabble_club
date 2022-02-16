class Match < ApplicationRecord
  validates :name, presence: true

  belongs_to :game
  has_many :participants, dependent: :destroy

  accepts_nested_attributes_for :participants, allow_destroy: true
  after_create :declare_result

  private

  def declare_result
    update_column(:winner_player_id, participants.order('score desc').first.player_id)
  end
end
