Given /^I am the registered member "([^"]*)"$/ do |username|
  if !User.first(:username => username) 
    User.create(
      :email    => "beatrice@hell.com",
      :username => "beatrice",
      :password => "dante"
    )
  end
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

Then /^I should see "([^"]*)" in the title$/ do |text|
  find('title').should have_content(text)
end

Then /^I should see "Couldn't log you in as '([^"]*)'"$/ do |feedback|
   within('#login') do
    find('p.feedback').should have_content(feedback)
  end 
end

When /^I check remember me$/ do
   within('#login') do
     check('rememberme')
   end
end

When /^I close my browser$/ do
    rack_test_driver = Capybara.current_session.driver 
    cookie_jar = rack_test_driver.browser.current_session.instance_variable_get(:@rack_mock_session).cookie_jar
    cookie_jar.instance_variable_get(:@cookies).reject! do |existing_cookie|
      existing_cookie.name.downcase == 'rack.session'
    end
end

When /^I come back$/ do
  /^I am on the login page$/
end

When /^I click on '(.+)'$/ do |link|
  click_on(link) 
end

