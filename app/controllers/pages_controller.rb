# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    # Empty, so by default by convention expects a home.html.erb in app/views/pages/.

    # TODO: Display this (from elsewhere) if in the Blog subapp...
    #redirect_to articles_path if logged_in?

    active_app('home')
    render "home"
  end

  def about
    active_app('about')
  end
end
