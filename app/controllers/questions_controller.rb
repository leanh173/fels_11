class QuestionsController < ApplicationController
  def index
    @categories = Category.all
    unless params[:filter_learn].nil? && params[:category_id].nil?
      unless "" == params[:category_id]
        category = Category.find params[:category_id]
        @questions = category.questions.paginate page: params[:page], per_page: 10
      else
        @questions = Question.paginate page: params[:page], per_page: 10
      end
      case 
      when "learned" == params[:filter_learn]
        @resultquestions = current_user.questions.paginate page: params[:page], per_page: 10
      when "not-learned" == params[:filter_learn]
        @resultquestions = @questions.not_learn_by current_user
      else
        @resultquestions = @questions
      end
    end
  end
end