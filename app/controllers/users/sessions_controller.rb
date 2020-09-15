# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :reject_user, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  def reject_user
    if params[:user][:email].present?
      @user = User.find_by(email: params[:user][:email])
      if @user.present? && @user.is_valid == false
        flash[:error] = "退会済みです。"
        redirect_to users_sign_in_path
      else
        flash[:error] = "メールアドレスまたはパスワードが不正です。"
      end
    end
  end
end
