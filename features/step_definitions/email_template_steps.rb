Given /^the following template exists:$/ do |template_hash|
  template_hash.hashes.each do |template|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    EmailTemplate.create(template)
  end
end
