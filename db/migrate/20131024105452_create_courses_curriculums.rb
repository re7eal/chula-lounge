class CreateCoursesCurriculums < ActiveRecord::Migration
  def change
    create_table :courses_curriculums do |t|
    	t.belongs_to :course
    	t.belongs_to :curriculum
    end
  end
end
