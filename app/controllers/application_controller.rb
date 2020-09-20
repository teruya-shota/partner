class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include Admin::AdminHelper
  include Admin::UsersHelper

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end

  private
      # 未ログイン管理者を弾く
  def authenticate_admin
    if current_admin == nil
      redirect_to admin_sign_in_path
    end
  end

  #ログイン管理者を弾く
  def prohibition_admin
    if current_admin
      redirect_to admin_path
    end
  end

  #ログイン顧客を弾く
  def prohibition_user
    if current_user
      redirect_to users_path
    end
  end
end
