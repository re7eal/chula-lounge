class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :know_rating
      t.integer :diff_rating
      t.integer :grade_rating
      t.belongs_to :course
      t.belongs_to :user

      t.timestamps
    end
  end
end
