class CreateSubscribeOrders < ActiveRecord::Migration
  def change
    create_table :subscribe_orders do |t|
      t.string :name
      t.string :url
      t.integer :gid
      t.integer :balance
      t.integer :bonus
      t.integer :user_id

      t.timestamps
    end
  end
end
