Given /^the following donations exist:$/ do |donations_table|
  donations_table.hashes.each do |donation|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Donation.create ({:scheduled_dropoff => donation["scheduled_dropoff"], :dropped_off_date => donation["dropped_off_date"],
                  :data_delivered => donation["data_delivered"], :family_code => donation["family_code"],
                  :user_id => donation["user_id"], :dropoff_site => donation["dropoff_site"], :approved_by => donation["approved_by"]})
  end
end
