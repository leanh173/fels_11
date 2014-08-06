class UserAnswer < ActiveRecord::Base
  belongs_to :user
  belongs_to :learning
  belongs_to :question
  belongs_to :answer
  validates :learning_id, presence: true 
  validates :user_id, presence: true
  validates :question_id, presence: true
  validates :answer_id, presence: true
end
