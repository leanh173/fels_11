class LessonsController < ApplicationController
  before_action :signed_in_user, only: [:create, :show]
  def create
    @lesson = Lesson.new lesson_params
    @lesson.user_id = current_user.id
    if @lesson.save
      category = @lesson.category
      redirect_to edit_category_lesson_path(category, @lesson)
    else
      flash[:error] = "Error, can not start lesson, please check again"
      redirect_to categories_path
    end
  end

  def show
    @lesson = Lesson.find params[:id]
    @category = @lesson.category
    @questions = @lesson.questions
  end

  def edit    
    @lesson = Lesson.find params[:id]
    @category = @lesson.category
    @questions = @lesson.questions
  end

  def update
    lesson = Lesson.find params[:id]
    category = lesson.category
    if lesson.update_attributes user_answers_params
      flash[:success] = "your test has been submited"
    else
      flash[:error] = "error can not submit your test"
    end
    redirect_to [category, lesson]
  end

  private
  def lesson_params
    params.require(:lesson).permit(:category_id)
  end
  def user_answers_params
    params.require(:lesson).permit(user_answers_attributes:[:answer_id, :id])
  end
end
