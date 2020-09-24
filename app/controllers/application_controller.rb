class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_user
    unless current_user
      redirect_to new_session_path
    end
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end
  helper_method :current_user
end
