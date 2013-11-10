class CreateTradeMessages < ActiveRecord::Migration
  def change
    create_table :trade_messages do |t|
      t.text :content
      t.integer :user_id
      t.integer :trade_id

      t.timestamps
    end
  end
end
