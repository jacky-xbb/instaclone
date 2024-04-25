Given('there is an existing user') do
  # Assuming User model has fields for email and password
  @user = FactoryBot.create(:user)
end

Given('I am on the sign in page') do
  visit new_user_session_path
end

When('I fill in the sign in form correctly') do
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: 'password123'
end

And('I submit the form') do
  click_button 'Log in'
end

Then('I should be logged in') do
  expect(page).to have_content('Sign out')
end
