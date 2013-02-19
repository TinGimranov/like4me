class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.text :answer
      t.integer :status

      t.timestamps
    end
  end
end
