

require 'spec_helper'

describe "Access Pages" do
  
  	subject{page}

  	describe "Visiting the users index page without user login"  do
 			before {visit users_path}
 			it {should have_selector('title',text:"Sign In")}
 			it {should have_selector('div.alert.alert-error',text:"Please login")}
 	end

 	describe "Visiting the users index page after user login " do
 		 let(:user) { FactoryGirl.create(:user) }

 		 before do 
 		 	visit signin_path(user)
			  	fill_in('Email', with: user.email )
    			fill_in('Password', with: user.password)
    			click_button('Submit') 
 		 end

 		 FactoryGirl.create(:user,name:"Bob",	email:"bob123@example.com")
 		 FactoryGirl.create(:user,name:"Nica",	email:"nice345@example.com")

 		 it {should have_selector('title',	text:"All Users")}
 		 it {should have_selector('h1',		text:"All Users")}

 		 it "should list each user"  do
 		 	User.all.each do |user|
 		 		page.should have_selector('li>a',text: user.name)
 		 	end
 		 end
 

 	end

	describe "Sign In Page"  do

		before {visit signin_path}

		it {should have_selector('title',text:"Sign In")}
		it {should have_selector('h1',   text:"Sign In")}
 	end

 	describe "Users trying to sign in"  do

 		describe "Sign In with blank fields"  do
 			before {visit signin_path}
 			before {click_button('Submit') }
 			 
 			xit {should have_selector('div.alert.alert-error')}

 			#make sure the alert persists only for the particular session 
 			describe "After visiting another page" do 

				before {visit home_path}
				xit {should_not have_selector('div.alert.alert-error')}
 			end
		end

		describe "Trying to access an edit page directly"  do
			let(:user) { FactoryGirl.create(:user) }
			before do 
				visit edit_user_path(user)
			  	fill_in('Email', with: user.email )
    			fill_in('Password', with: user.password)
    			click_button('Submit') 
			end

			describe "it should redirect to edit page" do
				xit {should have_selector('h1',text:"Modify Profile")}
			end
		end


		describe "Sign In with valid inputs"  do
			
		 
			let(:user) { FactoryGirl.create(:user) }
			
			before do 
				visit signin_path
			  	fill_in('Email', with: user.email )
    			fill_in('Password', with: user.password)
    			click_button('Submit') 
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



		describe "Checking Unauthorized access to the user pages" do
			let(:user) { FactoryGirl.create(:user) }

			describe "Checking UsersController" do

				describe "Checking access to edit page via edit user link" do
					before {visit edit_user_path(user)}
					it {should have_selector('div.alert.alert-error')}
					it {should have_selector('h1',text:'Sign In')}


				end
			end
		end
			#preventing direct update request without login
		describe "Sending direct request to update using put request " do
			before { put user_path(user)
			specify {response.should redirect_to(signin_path)}}
		end

		#Checking if any other logged in users can modify other members contents
		 
		 describe "Checking if any other logged in users can modify other members contents" do
		 	let (:user) { FactoryGirl.create(:user)}
		 	let(:wrong_user) {FactoryGirl.create(:user,email:"rajmj53@gmail.com")}
		 	#Login the right user
		 	before do 
				visit signin_path
			  	fill_in('Email', with: user.email )
    			fill_in('Password', with: user.password)
    			click_button('Submit') 
			end
			
			#visit the edit page of wrong user when right user is loged in
			describe "visit edit page of wrong user " do
				before { edit_user_path(wrong_user) }
				it {should_not have_selector("title",text:"Modify Profile")}
			end

		 end
		 
 	end


end

