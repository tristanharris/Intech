module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'

    when /^the lecture page for "([^"]+)"$/
      lecture_path(Lecture.find_by_title($1) || raise("Could not find lecture #{$1}"))

    when /^the lecture index page$/
      lectures_path

    when /^the admin page$/
      admin_path

    when /^the lecture admin page$/
      admin_lectures_path

    when /^the new event page$/
      new_admin_lecture_path

    when /^the new series page$/
      new_admin_series_path

    when /^the "([^"]+)" series page$/
      series_path(Series.find_by_title($1) || raise("Could not find series #{$1}"))

    when /^the series index page$/
      series_index_path

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
