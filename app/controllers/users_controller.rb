class UsersController < ApplicationController
    before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_path
    else
      render action: :edit
    end
  end

  def leave
  end

  def left
    user = current_user
    user.update!(is_valid: false)
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name,:email)
  end

end