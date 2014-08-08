class Lesson < ActiveRecord::Base
  has_many :learnings
  belongs_to :category
  validates :category_id, presence: true
  validates :name, presence: true
end
