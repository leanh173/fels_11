class LessonsController < ApplicationController
  before_action :signed_in_user, only: [:create, :show]
  def create
    @lesson = Lesson.new lesson_params
    @lesson.user_id = current_user.id
    if @lesson.save
      category = @lesson.category
      redirect_to [category, @lesson]
    else
      flash[:error] = "Error, can not start lesson, please check again"
      redirect_to categories_path
    end
  end

  def show
  end

  def index
  end

  private
  def lesson_params
    params.require(:lesson).permit(:category_id)
  end
end
