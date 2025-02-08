class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about], unless: :admin_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_path  # 管理者ログイン後は管理者トップページへ
    else
      about_path  # 一般ユーザーは「About」へ
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path  # 管理者ログアウト後は管理者ログインページへ
    else
      about_path  # 一般ユーザーは「About」へ
    end
  end

  private

  def admin_controller?
    self.class.module_parent_name == 'Admin'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def authenticate_admin!
    unless admin_signed_in? # 管理者がログインしていない場合
      redirect_to new_admin_session_path, alert: "管理者としてログインしてください"
    end
  end
end
