class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :user_answers
  has_many :questions, through: :user_answers
  validates :user_id , presence: true
  validates :category_id , presence: true
  after_create :generate_user_questions
  after_commit :update_mark, on: :update
  accepts_nested_attributes_for :user_answers
  
  private
  def generate_user_questions 
    @questions = self.category.questions.limit(20).order("RAND()")
    @questions.each do |question|
      user_answer = UserAnswer.new(user_id: self.user_id, lesson_id: self.id, 
        							question_id: question.id)
      user_answer.save
    end
  end

  def update_mark
    mark = 0
    self.user_answers.each do |user_answer|
      if user_answer.answer
        mark += 1 if user_answer.answer.right_answer
      end
    end
    self.update_columns mark: mark
  end
end
