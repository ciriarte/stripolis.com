Given /^I am viewing '(.+)'$/ do |page|
  visit(page)
end

Then /^I should see '(.+)' in the title$/ do |text|
  find('title').should have_content(text)
end

Then /^I should see a '(.+)' button$/ do |text|
  find('#' + 'register').should have_button(text)
end

Given /^I have entered '(.+)\s(.+)' as my name$/ do |first_name, last_name|
  within('#register') do
    fill_in('first_name', :with => first_name)
    fill_in('last_name', :with => last_name)
  end
end

Given /^I have entered '(.+)' as my email$/ do |email|
  within('#register') do
    fill_in('email', :with => email)
  end
end

Given /^I have entered my DOB as '([A-z][a-z][a-z]) (\d+)st (\d{4})'$/ do |month, day, year|
  within('#register') do
    select(year, :from => 'year')
    select(month, :from => 'month')
    select(day, :from => 'day')
  end
end

Given /^I have entered my password as '(.+)'$/ do |password|
  within('#register') do
    fill_in('password', :with => password)
  end
end


When /^I click Sign Up$/ do
  within('#register') do
    click_link_or_button('signup')
  end
end
