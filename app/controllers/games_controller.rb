class GamesController < ApplicationController
  before_action :find_game, except: %i[new create index]

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to games_path, notice: 'Game successfully created.'
    else
      flash[:error] = @game.errors.full_messages.join(', ')
      redirect_to new_game_path(@game)
    end
  end

  def update
    if @game.update(game_params)
      redirect_to games_path, notice: 'Game successfully updated.'
    else
      flash[:error] = @game.errors.full_messages.join(', ')
      redirect_to edit_game_path(@game)
    end
  end

  def destroy
    @game.destroy
    redirect_back(fallback_location: root_path, notice: 'Game successfully destroyed.')
  end

  private

  def find_game
    @game = Game.find_by(id: params[:id])
  end

  def game_params
    params.require(:game).permit(:title, :description)
  end
end
