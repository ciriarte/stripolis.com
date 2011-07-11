Given /^I am the registered member "([^"]*)"$/ do |username|
  User.create(
    :email    => "beatrice@hell.com",
    :username => "beatrice",
    :password => "dante"
  )
end

Given /^I am on the login page$/ do
  visit('/login')
end

When /^I fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  within("#login") do
    fill_in field, :with => value 
  end
end

When /^I press "([^"]*)"$/ do |button|
  click_on(:button)
end

Then /^I should see "([^"]*)"$/ do |instructions|
  within('#login') do
    find('instructions').should have_content(:instructions)
  end
end

Then /^I should see "([^"]*)" in the title$/ do |text|
  find('title').should have_content(text)
end

Then /^I should see "Couldn't log you in as '([^"]*)'$/ do |feedback|
   within('#login') do
    find('feedback').should have_content(:feedback)
  end 
end
