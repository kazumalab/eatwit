class SessionController < ApplicationController

  before_action :set_user, only: :create

  def new
  end

  def create
    if !!@user&.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def destroy
    logout
  end

  private

    def session_params
      params.require(:session).permit(
        :name,
        :password
      )
    end

    def set_user
      @user = User.find_by(name: session_params[:name])
    end
end
