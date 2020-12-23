# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Tell Rails to make these methods available to views.
  helper_method :active_app?, :current_user, :logged_in?

  def initialize
    super
    @apps = ["about", "blog", "home", "messages", "photos", "projects", "stock",
      "university",]
    @apps_status = {}

    clear_apps_status
    active_app("blog")
  end

  def active_app(app)
    clear_apps_status
    @apps_status[app] = "active-menu-item"
  end

  def active_app?(app)
    @apps_status[app]
  end

  def current_user
    # Return the user obj of the logged in user if any,
    # else find user in DB and return the user obj.
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user ## !! to convert to Boolean
  end

  def require_user
    return if logged_in?

    flash[:warning] = "You must be logged in to perform that action"
    redirect_to login_path   # root_path
  end

  private

  def clear_apps_status
    @apps.each { |k| @apps_status[k] = "" }
  end
end
