class ChangeDonationDropOffSiteToInteger < ActiveRecord::Migration
  def up
    remove_column :donations, :dropoff_site
    add_column :donations, :dropoff_site, :integer
  end

  def down
    add_column :donations, :dropoff_site, :integer
    remove_column :donations, :dropoff_site
  end
end
