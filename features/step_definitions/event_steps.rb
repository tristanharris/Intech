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
  Lecture.create! :title => title, :time => Time.now, :open => true
end

Given /^Lectures:$/ do |table|
  table.hashes.each do |item|
    item[:open] = true
    Lecture.create! item
  end
end

