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
  		let(:submit) {"Submit"}
  	
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

  			describe "after user is saved/signed in" do
          before{click_button submit}
  				let(:user) { User.find_by_email("example234@gmail.com")}	
          
  				it { should have_selector("title",text: user.name)}
          it { should have_selector("div.alert.alert-success")}
          it {should have_link("Sign Out",href: signout_path)}
          it {should_not  have_link("Sign In",href: signin_path) }
          it {should have_link("Profile",href: user_path(user))}
          it {should have_link("Settings",href: edit_user_path(user))}
          it {should have_link("Account")}
          it {should have_link("Home",href:root_path)}
          it {should have_link("Help",href:help_path)}
          it {should have_link("Users")}



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
#.....................Test casesfor User Edit Page...................
  describe "User Visiting edit  page" do
    let(:user) { FactoryGirl.create(:user) }
    
     before{ visit edit_user_path(user) }


    describe "Edit page layouts" do
       it { should have_selector('h1',   text: "Modify profile") }
       it { should have_selector('title',text: "Lets Tweet|Modify profile") }
    end
  
    describe "User modify profile with invalid information" do
    
      before{click_button "Submit"}

        it {should have_selector('div.alert.alert-error')}

    end

    describe "User modify profile with valid information" do
    
      before  do

        fill_in "Name" ,        with:"New name"
        fill_in "Email",        with: "useremail"
        fill_in "Password",     with:"secret"
        fill_in "Confirmation", with:"secret"
        click_button "Submit"

      end
      it {should have_selector('div.alert.alert-success')}
      it {should have_selector('h1',text: "New name")}
      it {should_not  have_link("Sign In",href: signin_path) }
      it {should  have_link("Sign Out",href: signin_path) }
     

    end

  end

    

  

end



