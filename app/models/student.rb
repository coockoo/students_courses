class Student < ActiveRecord::Base
  set_primary_key 'uuid'
  attr_accessible :name, :email
  has_and_belongs_to_many :courses

  validates :name, :email, presence: true
  validates_format_of :email, :with => /^\w|[1-9]@[\w]\.[\w]$/

  before_create do
   self.id = UUIDTools::UUID.random_create.to_s 
  end
end
