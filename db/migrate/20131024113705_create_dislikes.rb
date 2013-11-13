class CreateDislikes < ActiveRecord::Migration
  def change
    create_table :dislikes do |t|
      t.belongs_to :user
      t.belongs_to :comment
      t.timestamps
    end
  end
end
