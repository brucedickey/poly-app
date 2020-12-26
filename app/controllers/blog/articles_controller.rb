# frozen_string_literal: true

module Blog
  class ArticlesController < ApplicationController
    # These must be in proper order!
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:index, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def show
      # byebug   # Pauses at debug console
      # render plain: "In show()"
    end

    def index
      # @articles = Article.all
      @articles = Article.paginate(page: params[:page], per_page: 5)
    end

    def new
      # Is cancelable; in that case return to the pervious page.
      session[:return_to] = request.referer 

      @article = Article.new
    end

    def edit
      # Is cancelable; in that case return to the pervious page.
      session[:return_to] = request.referer

      # @article = Article.find(params[:id])
    end

    def create
      # render plain: params[:article]   # DEBUG, Sends to browser
      @article = Article.new(article_params)
      @article.user = current_user

      if @article.save
        flash[:success] = "Article was created successfully"
        # redirect_to article_path(@article)
        redirect_to @article   # The shortcut way
      else
        render "new"
      end
    end

    def update
      # @article = Article.find(params[:id])
      # if @article.update(params.require(:article).permit(:title, :description))

      if @article.update(article_params)
        flash[:success] = "Article was updated successfully"
        redirect_to @article
      else
        render "edit"
      end
    end

    def destroy
      @article.destroy
      redirect_to request.referer
    end

    private

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:blog_article).permit(:title, :description, category_ids: [])
    end

    def require_same_user
      return unless (current_user != @article.user) && !current_user.admin?

      flash[:warning] = "You can only edit or delete your own articles"
      redirect_to @article
    end
  end
end
