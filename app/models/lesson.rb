class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :user_answers
  has_many :questions, through: :user_answers
  validates :user_id , presence: true
  validates :category_id , presence: true
  after_save :generate_user_questions

  private
  def generate_user_questions 
    @questions = self.category.questions.limit(20).order("RAND()")
    @questions.each do |question|
      user_answer = UserAnswer.new(user_id: self.user_id, lesson_id: self.id, 
        							question_id: question.id)
      user_answer.save
    end
  end
end
