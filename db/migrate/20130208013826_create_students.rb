class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students, :id => false do |t|
      t.string :uuid, :primary => true, :limit => 36
      t.string :name
      t.string :email
      t.timestamps
    end
  end
end
