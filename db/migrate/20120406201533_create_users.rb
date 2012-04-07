class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :email
      t.integer :identity
      t.integer :locationID
      t.string :firstname
      t.string :lastname
      t.string :phone
      t.string :address
      t.string :organization
      t.timestamps
    end
  end
  def down
    drop_table :users
  end
end
