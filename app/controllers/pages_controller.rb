# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    # If empty, default by convention expects a home.html.erb in app/views/pages/.

    # redirect_to articles_path if logged_in?

    active_app("home")
    render "home"
  end

  def about
    active_app("about")
  end

  def sitemap
    render "sitemap"
  end
end
