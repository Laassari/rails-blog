class PasswordController < ApplicationController
  def show; end

  def create
    @user = User.find_by(email: params[:email])

    UserMailer.with(user: @user).reset_password.deliver_now if @user.present?

    flash.now[:notice] = 'An email was sent with a link to reset your password'
    render :show
  end

  def reset
    @user = User.find_signed(params[:token], purpose: 'password_reset')

    if @user.present?
      render :reset
    else
      redirect_to root_path
    end
  end

  def update
    @user = User.find_signed(params[:token], purpose: 'password_reset')

    @user.password = password_params[:password]

    if @user.save
      redirect_to root_path
    else
      flash[:alert] = @user.errors&.full_messages[0]
      render :reset
    end
  end

  private

  def password_params
    params.require(:password).permit(:password, :email)
  end
end
