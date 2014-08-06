class Question < ActiveRecord::Base
  has_many :user_answers
  has_many :answers
  belongs_to :lesson
  validates :word, presence: true 
end
