class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = current_user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to :root
    else
      render 'new'
    end
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to :root
    else
      render 'show'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
