Given /^I have no newsletters$/ do
  Newsletter.delete_all
end

Given /^I (only )?have newsletters titled "?([^\"]*)"?$/ do |only, titles|
  Newsletter.delete_all if only
  titles.split(', ').each do |title|
    Newsletter.create(:title => title)
  end
end

Then /^I should have ([0-9]+) newsletters?$/ do |count|
  Newsletter.count.should == count.to_i
end
