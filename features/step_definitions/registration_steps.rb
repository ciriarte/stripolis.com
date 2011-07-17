Given /^I am viewing '(.+)'$/ do |page|
  visit(page)
end

Then /^I should see '(.+)' in the title$/ do |text|
  find('title').should have_content(text)
end

Then /^I should see a '(.+)' button$/ do |text|
  find('#' + 'register').should have_button(text)
end
