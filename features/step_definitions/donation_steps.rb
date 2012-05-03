Given /^the following donations exist:$/ do |donations_table|
  donations_table.hashes.each do |donation|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    donation = empty_string_to_nil(donation)
    Donation.create(donation)
  end
end

def empty_string_to_nil (hash)
  hash.each do |key, value|
    if value.strip == ""
      hash[key] = nil
    end
  end
end
