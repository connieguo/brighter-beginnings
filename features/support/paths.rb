# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'
    when /^the donors home page$/
      '/users/main'
    when /^user main page$/
      '/users/main'
    when /^the manager main page$/
      '/users/main'
    when /^the case manager main page$/
      '/users/main'
    when /^the (.*) Details Page$/
      @family = Family.find_by_family_code($1)
      "/families/#{@family.id}/family_members"
    when /^the (.*) Donate Page$/
      @family = Family.find_by_family_code($1)
      "/donations/#{@family.id}/new"
    when /^the Pending Families Page$/
      "/families/pending"
    when /^the accounts page$/
      '/users'
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
