class AddFamilyCodeToFamilies < ActiveRecord::Migration
  def up
    add_column :families, :family_code, :string
  end
  def down
    remove_column :families, :family_code
  end
end
