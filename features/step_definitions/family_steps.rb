Given /^the following families exist:$/ do |families_table|
  families_table.hashes.each do |family|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Family.create(family)
  end
end

Given /^the following family members exist:$/ do |family_members_table|
  family_members_table.hashes.each do |family_member|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    FamilyMember.create(family_member)
  end
end






