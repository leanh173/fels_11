class UserAnswer < ActiveRecord::Base
  belongs_to :user
  belongs_to :lesson
  belongs_to :question
  belongs_to :answer
  validates :lesson_id, presence: true 
  validates :user_id, presence: true
  validates :question_id, presence: true
end
