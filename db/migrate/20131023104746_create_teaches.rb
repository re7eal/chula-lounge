class CreateTeaches < ActiveRecord::Migration
  def change
    create_table :teaches do |t|
      t.belongs_to :professor
      t.belongs_to :course
      t.integer :year

      t.timestamps
    end
  end
end
