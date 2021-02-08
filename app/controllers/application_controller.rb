class ApplicationController < ActionController::Base
  def current_user
    user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    user
  end

  def check_authenticity!
    redirect_to :login unless current_user
  end
end
