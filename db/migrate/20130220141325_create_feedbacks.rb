class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :email
      t.text :question
      t.boolean :read, :default => 0
      t.timestamps
    end
  end
end
