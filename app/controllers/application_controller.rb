class ApplicationController < ActionController::Base
  def current_user
    user ||= User.find(session[:user_id]) if session[:user_id]
    user
  end
end
