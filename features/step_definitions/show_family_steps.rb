Given /^the following families exist:$/ do |families_table|
  families_table.hashes.each do |family|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Family.create(family)
  end
end



