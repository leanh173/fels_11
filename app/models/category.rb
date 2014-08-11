class Category < ActiveRecord::Base
  has_many :lessons
  has_many :questions
  validates :name_course, presence: true 
end
