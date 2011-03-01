Then /^I should see my basket containing:$/ do |table|
  page.should have_selector('.basket') do
    with_text('Your Basket')
  end
  table.diff!(tableish('.basket tr', 'td,th'))
end

