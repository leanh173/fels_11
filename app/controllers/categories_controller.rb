class CategoriesController < ApplicationController
  def show
    @category = Category.find params[:id]
    @lessons = @category.lessons.paginate(page: params[:page], per_page: 5)
  end

  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end
end
