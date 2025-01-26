class Admin::UsersController < Admin::ApplicationController
  before_action :authenticate_admin!
  
  # ユーザー一覧
  def index
    @users = User.all
  end

  # ユーザー詳細表示
  def show
    @user = User.find(params[:id])  
  end
  
  # ユーザー削除
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: 'ユーザーを削除しました。'
  end

  # ユーザー編集
  def edit
    @user = User.find(params[:id])
  end

  # ユーザー更新
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path, notice: 'ユーザー情報を更新しました。'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :admin)
  end
end