class MatchesController < ApplicationController
  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)

    if @match.save
      redirect_back(fallback_location: root_path, notice: 'Match successfully updated.')
    else
      render :new
    end
  end

  def destroy
    @match.destroy
    redirect_back(fallback_location: root_path, notice: 'Match successfully destroyed.')
  end

  private

  def match_params
    params.require(:match).permit(:name, participants_attributes: [:player_id, :game_id, :match_id, :score])
  end
end
