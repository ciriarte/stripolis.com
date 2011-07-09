Given /^I am viewing '(.+)'$/ do |page|
  visit(page)
end

Then /^I should see '(.+)'$/ do |text|
  response_body.should =~ Regexp.new(Regexp.escape(text))
end
