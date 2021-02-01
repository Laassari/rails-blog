class UserMailer < ApplicationMailer
  def reset_password
    @user = params[:user] || params
    token = @user.signed_id(purpose: 'password_reset')
    @link = password_reset_url(token: token)

    mail(to: @user.email, subject: 'Passsword reset')
  end
end
