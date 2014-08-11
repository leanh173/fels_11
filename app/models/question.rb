class Question < ActiveRecord::Base
  has_many :user_answers
  has_many :answers
  belongs_to :category
  validates :word, presence: true 
end
