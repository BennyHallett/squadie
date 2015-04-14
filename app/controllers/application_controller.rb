class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def current_user
    if Rails.env == 'development'
      session['user_id'] = 1
      @current_user ||= User.find(1)
    else
      @current_user ||= User.find(session['user_id']) if session['user_id']
    end

  end

  def current_user=(user)
    @current_user = user
  end

  def logged_in
    redirect_to '/login'if current_user.nil?
  end

  helper_method :current_user
end
