class CreateCurriculums < ActiveRecord::Migration
  def change
    create_table :curriculums do |t|
      t.string :name
      t.string :abbreviation
      t.belongs_to :faculty
      
      t.timestamps
    end
  end
end
