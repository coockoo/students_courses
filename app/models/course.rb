class Course < ActiveRecord::Base
  set_primary_key 'uuid'
  attr_accessible :title, :descr
  has_and_belongs_to_many :students

  validates :title, presence: true

  before_create do
   self.id = UUIDTools::UUID.random_create.to_s 
  end
end
