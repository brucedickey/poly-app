# frozen_string_literal: true

module Blog
  class CategoriesController < ApplicationController
    # To require an admin logged in for new and create
    before_action :require_admin, except: [:index, :show]

    def index
      # @categories = Category.all
      @categories = Category.paginate(page: params[:page], per_page: 5)
    end

    def new
      # Is cancelable; in that case return to the pervious page.
      session[:return_to] = request.referer 

      @category = Category.new
    end

    def create
      @category = Category.new(category_params)
      if @category.save
        flash[:success] = "Category was sucessfully created"
        redirect_to categories_path
      else
        render "new"
      end
    end

    def edit
      # Is cancelable; in that case return to the pervious page.
      session[:return_to] = request.referer 
            
      @category = Category.find(params[:id])
    end

    def show
      @category = Category.find(params[:id])
      @articles = @category.articles.paginate(page: params[:page], per_page: 5)
    end

    def update
      @category = Category.find(params[:id])
      if @category.update(category_params)
        flash[:success] = "Category name updated successfully"
        redirect_to @category
      else
        render "edit"
      end
    end

    private

    def category_params
      #params.require(:category).permit(:name)
      params.require(:blog_category)
      params[:blog_category].require(:name)
      { "name" => params[:blog_category][:name] }
    end

    def require_admin
      return unless !logged_in? || (logged_in? && !current_user.admin?)

      flash[:warning] = "Only admin can perform that action"
      redirect_to categories_path
    end
  end
end
