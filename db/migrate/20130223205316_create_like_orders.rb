class CreateLikeOrders < ActiveRecord::Migration
  def change
    create_table :like_orders do |t|
      t.string :name
      t.string :url
      t.integer :balance
      t.integer :sex
      t.integer :gender_min
      t.integer :gender_max
      t.integer :user_id

      t.timestamps
    end
  end
end
