class Student < ActiveRecord::Base
  set_primary_key 'uuid'
  attr_accessible :name, :email
  has_and_belongs_to_many :courses

  validates :name, :email, presence: true
  validates_format_of :email, :with => /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i

  before_create do
   self.id = UUIDTools::UUID.random_create.to_s 
  end
end
