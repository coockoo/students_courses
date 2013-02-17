class Student < ActiveRecord::Base
  attr_accessible :name, :email
  has_and_belongs_to_many :courses

  validates :name, :email, presence: true
  validates_format_of :email, :with => /^\w|[1-9]@[\w]\.[\w]$/
end
