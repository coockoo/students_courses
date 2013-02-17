class Course < ActiveRecord::Base
  attr_accessible :title, :descr
  has_and_belongs_to_many :students

  validates :title, presence: true
end
