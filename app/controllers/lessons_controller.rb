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

  def index
  end

  def edit    
    @lesson = Lesson.find params[:id]
    @category = @lesson.category
    @questions = @lesson.questions
  end

  def update
    lesson = Lesson.find params[:id]
    category = lesson.category
    user_answers = lesson.user_answers
    if params[:question_id]
      params[:question_id].each do |question_id, answer_id|
        user_answer = user_answers.find_by(question_id: question_id)
        user_answer.update_attributes answer_id: answer_id
      end
    end
    lesson.update_attributes mark: 0
    redirect_to [category, lesson]
  end

  private
  def lesson_params
    params.require(:lesson).permit(:category_id)
  end
end
