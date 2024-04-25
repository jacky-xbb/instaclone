Given('I am on the sign up page') do
  visit new_user_registration_path
end

When('I fill in the sign up form correctly') do
  fill_in 'Email', with: 'user@example.com'
  fill_in 'Username', with: 'user'
  fill_in 'Password', with: 'securepassword!'
  fill_in 'Password confirmation', with: 'securepassword!'
end

When('I submit the sign up form') do
  click_button 'Sign up'
end

Then('I should be signed up and logged in') do
  expect(page).to have_content('Sign out')
end
