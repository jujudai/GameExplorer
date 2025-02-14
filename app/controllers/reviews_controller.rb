class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :authorize_user, only: [:edit, :update, :destroy]
  before_action :reject_guest_user, only: [:create]

  def create
    @game = Game.find(params[:game_id])
    @review = @game.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      redirect_to game_path(@game), notice: "レビューを投稿しました。"
    else
      redirect_to game_path(@game), alert: "レビューの投稿に失敗しました。"
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to game_path(@review.game), notice: "レビューを更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to game_path(@review.game), notice: "レビューを削除しました。"
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def authorize_user
    redirect_to game_path(@review.game), alert: "権限がありません。" unless @review.user == current_user
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

  def reject_guest_user
    if current_user.guest_user?
      redirect_to game_path(params[:game_id]), alert: "ゲストユーザーはレビューを投稿できません。"
    end
  end
end
