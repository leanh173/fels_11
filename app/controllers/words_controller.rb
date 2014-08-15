class WordsController < ApplicationController
  def index
    @questions = Question.all
    @categories = Category.all
    unless params[:filter_learn].nil? && params[:category].nil?
      case 
      when "learned" == params[:filter_learn]
        @resultquestions = current_user.questions
      when "not-learned" == params[:filter_learn]
        @resultquestions = @questions.not_learn_by current_user
      else
        @resultquestions = @questions
      end
      unless "" == params[:category]
        @resultquestions = @resultquestions.in_category params[:category]
      end
    end
  end
end