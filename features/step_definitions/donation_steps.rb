Given /^the following donations exist:$/ do |donations_table|
  donations_table.hashes.each do |donation|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Donation.create(donation)
  end
end







