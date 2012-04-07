class CreateDonations < ActiveRecord::Migration
  def up
    create_table :donations do |t|
      t.string :scheduled_dropoff
      t.string :dropoff_site
      t.string :dropped_off_date
      t.string :date_delivered
      t.string :family_code
      t.integer :user_id
      t.timestamps
    end
  end
  def down
    drop_table :donations
  end
end
