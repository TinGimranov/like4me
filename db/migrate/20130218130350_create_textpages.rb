class CreateTextpages < ActiveRecord::Migration
  def change
    create_table :textpages do |t|
      t.string :title
      t.text :content
      t.string :slug
      t.integer :hidden

      t.timestamps
    end
  end
end
