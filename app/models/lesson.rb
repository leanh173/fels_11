class Lesson < ActiveRecord::Base
  has_many :learnings 
  validates :category_id, presence: true 
end
