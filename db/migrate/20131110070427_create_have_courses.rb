class CreateHaveCourses < ActiveRecord::Migration
  def change
    create_table :have_courses do |t|
      t.string :course_number
      t.string :course_name
      t.integer :course_section
      t.integer :trade_id

      t.timestamps
    end
  end
end
