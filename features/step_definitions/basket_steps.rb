Then /^I should see my basket containing:$/ do |table|
  page.should have_selector('.basket') do
    with_text('Your Basket')
  end
  table.diff!(tableish('.basket tr', 'td,th'))
end

Then /^I should see my basket empty$/ do
  page.should have_selector('.basket') do
    with_text('Your Basket')
    without_selector('tr')
  end
end



When /^I click to remove basket item "([^"]*)"$/ do |title|
  puts '!!!!!!!!!!!!!!!! Step needs improving'
  click_button('Remove')
end

