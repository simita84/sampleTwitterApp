Given(/^a user visits signin page$/) do
   visit signin_path
end

When(/^he submits invalid signin inforrmation$/) do
  click_button ('Sign In')
end

Then(/^he should see an error message$/) do
  page.should have_selector('div.alert.alert-error')
end

Given(/^the user has an account$/) do
   @user=User.create(name:"Example",email:"example@gmail.com",
   					 password:"secret",password_confirmation:"secret")
end

Given(/^user submits valid signin information$/) do
  fill_in "Email", 		with:@user.email
  fill_in "Password",	with:@user.password
  click_button 'Sign In'

end

Then(/^he should see his profile page$/) do
  page.should have_selector('h1',   text: @user.name)
  page.should have_selector('title',text: @user.name)

end

Then(/^he should see  a signout link$/) do
  page.should have_link("Sign Out")
end
