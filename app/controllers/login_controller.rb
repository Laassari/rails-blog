class LoginController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(user_params[:email])

    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to root_url, notice: 'Logged in!'
    else
      flash.now[:alert] = 'Email or password is invalid'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
