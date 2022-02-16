class LeaderBoardController < ApplicationController
  MIN_MATCH_LIMIT = 10

  def show
    @top_performers = Player.joins(:participants).select('
                     players.first_name,
                     AVG(participants.score) as average_score,
                     COUNT(participants.id) as number_of_matches')
                            .group('players.id')
                            .having('COUNT(participants.id) >= ?', MIN_MATCH_LIMIT)
                            .limit(10)
  end
end
