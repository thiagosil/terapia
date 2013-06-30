class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :check_authentication

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    if current_user
      true
    else
      false
    end
  end

  def check_authentication
    unless user_signed_in?
      flash[:notice] = 'Efetue Login'
      redirect_to log_in_path
      return false
    end

    return true
  end
end
