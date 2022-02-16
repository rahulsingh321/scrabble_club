class Player < ApplicationRecord
  validates :first_name, :last_name, :email, :phone, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'requires a valid email format' }

  has_many :participants, dependent: :destroy

  def max_score_record
    participants.order('score desc').first
  end

  def stats
    Match.joins(:participants)
         .where('participants.player_id = ?', id)
         .select('AVG(participants.score) as average_score,
                  MAX(participants.score) as highest_score,
                  SUM(CASE WHEN (matches.winner_player_id = player_id) THEN 1 ELSE 0 END) AS number_of_wins,
                  COUNT(participants.id) - SUM(CASE WHEN (matches.winner_player_id = player_id) THEN 1 ELSE 0 END) AS number_of_losses,
                  participants.player_id')
         .group('participants.player_id')
         .take
  end
end
