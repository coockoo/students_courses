class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses, :id => false do |t|
      t.string :uuid, :primary => true, :limit => 36
      t.string :title
      t.string :descr
      t.timestamps
    end
  end
end
