Given /^Series:$/ do |table|
  table.hashes.each do |item|
    create_series(item)
  end
end

def create_series(data)
  defaults = HashWithIndifferentAccess.new({:title => 'A Series', :details => 'Series details', :active => true})
  data = defaults.merge(data)
  Series.create! data
end
