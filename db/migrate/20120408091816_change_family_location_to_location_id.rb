class ChangeFamilyLocationToLocationId < ActiveRecord::Migration
  def up
    remove_column :families, :location
    add_column :families, :locationID, :integer
  end

  def down
    add_column :families, :location, :string
    remove_column :families, :locationID, :integer
  end
end
