class RegistrationController < ApplicationController
  def create
    @user = User.find_from_token(params[:token])
    redirect_to new_user_path unless @user
    if @user.activate
      redirect_to @user
    else
      redirect_to new_user_path
    end
  end
end

