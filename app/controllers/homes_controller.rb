class HomesController < ApplicationController
  def top
    @games = Game.all
  end

  def about

  end
end
