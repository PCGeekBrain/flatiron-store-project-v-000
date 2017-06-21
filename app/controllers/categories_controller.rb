class CategoriesController < ApplicationController
    def show
        @category = Category.find_by(id: params[:id])
        redirect_to root_path if @category.nil?
    end
    
    def index
        @categories = Category.all
    end
    
end
