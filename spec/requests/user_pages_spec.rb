require 'spec_helper'

describe "User Pages" do

  subject {page}

 #.....................Test cases for User Profile page...................
	describe "Visiting User Profile page" do
		let(:user){ FactoryGirl.create(:user)}
		before{visit user_path(user)}
			it {should have_selector('title',:text=>user.name)}
			it {should have_selector('h1',:text=>user.name)}
	end
  
 #.....................Test casesfor User Sign Up...................
 	describe "User Sign Up" do	
		before{ visit signup_path }
			it {should have_selector('title', :text=>'Sign Up') }
			it {should have_selector('h1',    :text=>'Login')   }
	end

 	describe "Signup Page" do
  	
  		before {visit signup_path} 
  	
  		describe "Sign Up with valid user credentials" do
  			it "should create a valid user" do
  				old_count=User.count
 	 			fill_in "Name" ,		with: "Example user"
 	 			fill_in "Email", 		with:"example234@gmail.com"
 	 			fill_in "Password", 	with:"secret"
 	 			fill_in "Confirmation", with:"secret"
 	 			click_button("Create my account")
 	 			new_count=User.count
 				new_count.should==old_count +1
  			end
  		end
  		
  		describe "Sign Up with invalid user credentials" do
  			it "should not create a valid user with blank inputs" do
  				old_count=User.count
 				click_button("Create my account")
 				new_count=User.count
 				new_count.should==old_count
  			end
  			it "should not create a valid user with invalid inputs (invalid Email)" do
  				old_count=User.count
 	 			fill_in "Name" ,		with: "Example user"
 	 			fill_in "Email", 		with:"example234"
 	 			fill_in "Password", 	with:"secret"
 	 			fill_in "Confirmation", with:"secret"
 	 			click_button("Create my account")
 	 			new_count=User.count
 				new_count.should==old_count 
  			end
  			it "should not create a valid user with invalid inputs (differnt Password Confirmation)" do
  				old_count=User.count
 	 			fill_in "Name" ,		with: "Example user"
 	 			fill_in "Email", 		with:"example234"
 	 			fill_in "Password", 	with:"secret1234"
 	 			fill_in "Confirmation", with:"secret"
 	 			click_button("Create my account")
 	 			new_count=User.count
 				new_count.should==old_count 
  			end
  		end
 	end
#.....................Test casesfor User Sign Up...................

end
