class Question < ActiveRecord::Base
  has_many :user_answers
  has_many :answers
  belongs_to :category
  validates :word, presence: true
  scope :not_learn_by, ->(user){
    if user.questions.empty?
      not_learn_question_ids = ""
    else
      not_learn_question_ids = user.questions.distinct.map(&:id)
    end
    where("id NOT IN (?)", not_learn_question_ids )}
  scope :in_category_id, ->(category_id){where(category_id: category_id)}
end
