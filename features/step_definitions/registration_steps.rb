Given /^I am viewing '(.+)'$/ do |page|
  visit(page)
end

Then /^I should see '(.+)' in the title$/ do |text|
  find(:xpath, '//html/body').should have_content(text)
end
