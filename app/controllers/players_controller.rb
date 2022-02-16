class PlayersController < ApplicationController
  before_action :find_player, except: %i[new index create]

  def index
    @players = Player.all.order('updated_at DESC')
  end

  def show
    @stats = @player.stats
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)

    if @player.save
      redirect_to players_path, notice: 'Player successfully created.'
    else
      flash[:error] = @player.errors.full_messages.join(', ')
      redirect_to new_player_path(@player)
    end
  end

  def update
    if @player.update(player_params)
      redirect_to players_path, notice: 'Player successfully updated.'
    else
      flash[:error] = @player.errors.full_messages.join(', ')
      redirect_to edit_player_path(@player)
    end
  end

  def destroy
    @player.destroy
    redirect_back(fallback_location: root_path, notice: 'Player successfully destroyed.')
  end

  private

  def find_player
    @player = Player.find_by(id: params[:id])
  end

  def player_params
    params.require(:player).permit(:first_name, :last_name, :email, :nick_name, :phone)
  end
end
