class CreateSiteUsers < ActiveRecord::Migration
  def change
    create_table :site_users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.integer :balance

      t.timestamps
    end
  end
end
