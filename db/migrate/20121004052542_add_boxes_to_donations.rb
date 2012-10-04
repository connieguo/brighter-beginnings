class AddBoxesToDonations < ActiveRecord::Migration
  def up
    add_column :donations, :num_boxes, :integer
  end

  def down
    remove_column :donations, :approved_by
  end
end
