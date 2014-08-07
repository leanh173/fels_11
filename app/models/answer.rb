class Answer < ActiveRecord::Base
  has_many :user_answers
  belongs_to :question
  validates :question_id, presence: true
end
