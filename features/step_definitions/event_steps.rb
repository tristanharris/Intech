Given /^the following events:$/ do |events|
  Event.create!(events.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) event$/ do |pos|
  visit events_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following events:$/ do |expected_events_table|
  expected_events_table.diff!(tableish('table tr', 'td,th'))
end

Given /^A lecture "([^"]*)"$/ do |title|
  create_lecture(:title => title)
end

Given /^Lectures:$/ do |table|
  table.hashes.each do |item|
    create_lecture(item)
  end
end

def create_lecture(data)
  defaults = HashWithIndifferentAccess.new({:title => 'A Lecture', :time => Time.now + 2.days, :open => true, :series => 'default'})
  data = defaults.merge(data)
  data[:event] = data[:series]+'-'+data[:title] unless data[:event]
  data[:series] = Series.find_or_create_by_title(data[:series]) {|s| s.active = true}
  data[:event] = Event.find_or_create_by_title(data[:event]) {|s| s.open = true; s.series = data[:series]; s.time = data[:time]}
  data.delete(:series)
  puts data.inspect
  Lecture.create! data
end
