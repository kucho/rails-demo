class GamesController < ApplicationController
  before_action :set_game, only: %i[show edit update destroy]
  skip_before_action :verify_authenticity_token

  def index
    @games = Game.all   # Get all the games and saved them on @games
    render json: @games # Render all the games on JSON format
  end

  def show
    render json: @game # render the specific game using json format
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      render json: @game
    else
      render json: @game.errors
    end
  end

  def destroy
    @game.destroy # Destroy it.
    render json: { status: 'Successfully destroyed', data: @game }, status: :ok
  end

  def update
    if @game.update(game_params)
      render json: @game # render the updated record back
    else
      render json: @game.errors, status: :unprocessable_entity # render errors
    end
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name, :genre, :price,
                                 :release_date, :company_id)
  end
end
