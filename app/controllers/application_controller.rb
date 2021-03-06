class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate
    if not current_user
      redirect_to signin_path, notice: 'Not signed in!'
    end
  end

  helper_method :current_user


end
