class MatchesController < ApplicationController
  before_action :find_game

  def index
    @matches = @game.matches
  end

  def new
    @match = Match.new

    2.times do
      @match.participants.build
    end
  end

  def create
    @match = Match.new(match_params)

    if @match.save
      redirect_back(fallback_location: root_path, notice: 'Match successfully updated.')
    else
      flash[:error] = @match.errors.full_messages.join(', ')
      redirect_to new_game_match_path(@game, @match)
    end
  end

  private

  def find_game
    @game = Game.find_by(id: params[:game_id])
  end

  def match_params
    params.require(:match).permit(:name, participants_attributes: %i[player_id game_id match_id score])
  end
end
