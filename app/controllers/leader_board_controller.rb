class LeaderBoardController < ApplicationController
  def show
    # players_ids = Player.joins(:participants).group('players.id').having("count(participants.id)>=10")
    # @players = Player.where(id: players_ids).includes(:participants).order("participants.score desc").limit(10)
  end
end