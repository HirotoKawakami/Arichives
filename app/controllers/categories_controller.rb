class CategoriesController < ApplicationController
    
    def show
        @category = Category.find_by(id: params[:id])
        @articles =  Article.where(category_id: @category.id).paginate(page: params[:page], per_page: 9)
    end
end
