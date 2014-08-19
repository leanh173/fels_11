class Admin::QuestionsController < ApplicationController
  before_action :admin_user 
  def new
    @question = Question.new
    @categories = Category.all
    4.times {answer = @question.answers.build}
  end

  def create
    @question = Question.new question_params
    if @question.save
      flash[:success] = "create new question successful"
      redirect_to admin_question_path(@question)
    else
      flash[:error] = "error can not create new question, please check again"
      redirect_to new_admin_question_path
    end
  end

  def edit
    @question = Question.find params[:id]
    @answers = @question.answers
  end

  def update
    @question = Question.find params[:id]
    if @question.update_attributes question_params
      flash[:success] = "update question successful"
      redirect_to admin_question_path(@question)
    else
      flash[:error] = "error can not update question, please check again"
      redirect_to edit_admin_question_path(@question)
    end
  end

  def show
    @question = Question.find params[:id]
    @answers = @question.answers
  end

  def index
    @categories = Category.all
    unless params[:category_id].blank?
      category = Category.find params[:category_id]
      @questions = category.questions.paginate page: params[:page], per_page: 10
    else
      @questions = Question.paginate page: params[:page], per_page: 10
    end
  end

  def destroy
    Question.find(params[:id]).destroy
    flash[:success] = "Question deleted"
    redirect_to admin_questions_path
  end

  private
  def question_params
    params.require(:question).permit(:word, :content, :category_id,
                                     answers_attributes:[:content, :right_answer, :id])
  end

  def admin_user
    unless current_user.admin
      redirect_to root_url
    end 
  end
end