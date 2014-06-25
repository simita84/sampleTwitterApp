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
			it {should have_selector('h1',    :text=>'Sign Up')   }
	end

 	describe "Signup Page" do
  	
  		before {visit signup_path} 
  		let(:submit) {"Create my account"}
  	
  		describe "Sign Up with valid user credentials" do

        before do 
          fill_in "Name" ,    with: "Example user"
          fill_in "Email",    with:"example234@gmail.com"
          fill_in "Password",   with:"secret"
          fill_in "Confirmation", with:"secret"
      end
  			
        it "should create a valid user" do
 	 			  expect{click_button submit}.to change(User,:count).by(1)
  			end

  			describe "after user is saved" do
          before{click_button submit}
  				let(:user) { User.find_by_email("example234@gmail.com")}	
          
  				it { should have_selector("title",text: user.name)}
          it { should have_selector("div.alert.alert-success")}
          it { should have_link('Sign Out')}

  			end
  		end
  		
  		describe "Sign Up with invalid user credentials" do
  			it "should not create a valid user with blank inputs" do
	 
 			 	expect{click_button submit}.not_to change(User,:count)
 				 
  			end
  			it "should not create a valid user with invalid inputs (invalid Email)" do
  			 
 	 			fill_in "Name" ,		with: "Example user"
 	 			fill_in "Email", 		with:"example234"
 	 			fill_in "Password", 	with:"secret"
 	 			fill_in "Confirmation", with:"secret"
 	 	 		expect{click_button submit}.not_to change(User,:count)
  			end
  			it "should not create a valid user with invalid inputs (differnt Password Confirmation)" do
 	 			fill_in "Name" ,		with: "Example user"
 	 			fill_in "Email", 		with:"example234"
 	 			fill_in "Password", 	with:"secret1234"
 	 			fill_in "Confirmation", with:"secret"
 	 	 		expect{click_button submit}.not_to change(User,:count)
  			end
  		end
 	end
#.....................Test casesfor User Sign Up...................

end
