class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    @reviews = @game.reviews
  end
end
