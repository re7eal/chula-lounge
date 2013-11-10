class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.text :note
      t.boolean :finished
      t.integer :user_id

      t.timestamps
    end
  end
end
