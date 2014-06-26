require 'spec_helper'

describe "AuthenticationPages" do
  
  	subject{page}

	describe "Sign In Page"  do

		before {visit signin_path}

		it {should have_selector('title',text:"Sign In")}
		it {should have_selector('h1',   text:"Sign In")}
 	end

 	describe "Sign In form"  do

 		describe "Sign In with blank fields"  do
 			before {visit signin_path}
 			before {click_button('Sign In') }
 			 
 			it {should have_selector('div.alert.alert-error')}

 			#make sure the alert persists only for the particular session 
 			describe "After visiting another page" do 

				before {visit home_path}
				it {should_not have_selector('div.alert')}
 			end
		end

		describe "Sign In with valid inputs"  do
			
		 
			let(:user) { FactoryGirl.create(:user) }
			
			before do 
				visit signin_path
			  	fill_in('Email', with: user.email )
    			fill_in('Password', with: user.password)
    			click_button('Sign In') 
			end
			

			it {should have_selector("title",text: user.name)}
			it {should have_selector("h1",text: user.name)}
			it {should have_link("Sign Out",href: signout_path)}
			it {should_not  have_link("Sign In",href: signin_path) }

			it {should have_link("Profile",href: user_path(user))}

			it {should have_link("Settings",href: edit_user_path(user))}

			it {should have_link("Account")}
			it {should have_link("Home",href:root_path)}
			it {should have_link("Help",href:help_path)}
			it {should have_link("Users")}

			describe "Clicking the signout link"  do
				before {click_link 'Sign Out'}
				it {should have_link('Sign In')}
			end
		end
 	end
end
