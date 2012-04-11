class ChangeAddressInUsers < ActiveRecord::Migration
  def up
    remove_column :users, :address
    add_column :users, :address_1, :string
    add_column :users, :address_2, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zipcode, :string
  end

  def down
    add_column :users, :address, :string
    remove_column :users, :address_1
    remove_column :users, :address_2
    remove_column :users, :city
    remove_column :users, :state
    remove_column :users, :zipcode
  end
end
