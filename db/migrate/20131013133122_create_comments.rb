class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.date :timestamp
      t.belongs_to :course
      t.belongs_to :user

      t.timestamps
    end
  end
end
