class AddApprovedByColumns < ActiveRecord::Migration
  def up
    add_column :donations, :approved_by, :integer
    add_column :families, :approved_by, :integer
  end

  def down
    remove_column :donations, :approved_by
    remove_column :donations, :approved_by
  end
end
