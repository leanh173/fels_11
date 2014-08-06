class Category < ActiveRecord::Base
  has_many :lessons
  validates :name_course, presence: true 
end
