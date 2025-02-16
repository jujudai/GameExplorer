class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    @reviews = @game.reviews
  end

  def index
    @games = Game.all
    @keyword = params[:search]


    # 🔍 検索機能（既存の検索ボックスを活用）
    if params[:search].present?
      @games = @games.where("title LIKE :query", query: "%#{params[:search]}%")
    end

    # 📌 並び替え機能
    case params[:sort]

    when "newest"
      @games = @games.order(created_at: :desc) # 新しい順
    when "oldest"
      @games = @games.order(created_at: :asc) # 古い順
    when "alphabetical"
      @games = @games.order(title: :asc) # あいうえお順
    end
  end
end
