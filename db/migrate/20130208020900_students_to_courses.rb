class StudentsToCourses < ActiveRecord::Migration
  def change
    create_table :courses_students do |t|
      t.string :student_id, :limit => 36
      t.string :course_id, :limit => 36
    end
  end
end
