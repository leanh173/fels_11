class Learning < ActiveRecord::Base
  belongs_to :user
  belongs_to :lesson
  has_many :user_answers 
  validates :user_id , presence: true
  validates :lesson_id , presence: true
end
