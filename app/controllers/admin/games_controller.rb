class Admin::GamesController < ApplicationController
    before_action :authenticate_admin!
    layout 'admin'

    def index
      @games = Game.all
      @game = Game.new
    end

    def new
      @game = Game.new
    end

    def create
      @game = Game.new(game_params)
      if @game.save
        redirect_to admin_games_path, notice: "ゲームを登録"
      else
        @games = Game.all
          render :index
      end
    end

    def edit
      @game = Game.find(params[:id])
    end

    def update
      @game = Game.find(params[:id])
      if @game.update(game_params)
        redirect_to admin_games_path, notice: "ゲームを更新しました。"
      else
        render :edit
      end
    end

    def destroy
      @game = Game.find(params[:id])
      @game.destroy
      redirect_to admin_games_path, notice: "ゲームを削除しました。"
    end

    private

    def ensure_admin
      redirect_to root_path, alert: "管理者以外はアクセスできません。" unless current_user.admin?
    end

    def game_params
      params.require(:game).permit(:title, :description, :image, :genre_id)
    end
  end
