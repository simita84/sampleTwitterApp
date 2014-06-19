require 'spec_helper'

describe "Static Pages of the Site" do

	subject {page}

	describe "Home Page" do
		before{	visit root_path}
			it { should have_selector('title',:text=>'Lets Tweet|Home')}
			it { should have_selector('h1',:text=>'Welcome')}
		end
   
	describe "Help Page" do
		before { visit help_path }
			it {should have_selector('title',:text=>'Lets Tweet|Help') }
			it {should have_selector('h1',:text=>'Help')}
		end

	describe "About Us Page" do
		before { visit about_path}
			it {should have_selector('title',:text=>'Lets Tweet|About Us')}
			it {should have_selector('h1',:text=>'About Us')}
		end

	describe "Contact US page" do
		before { visit contact_path}
 			it {should have_selector('title',:text=>'Lets Tweet|Contact Us')}
 			it {should have_selector('h1',:text=>'Contact Us')}
		end

		it "should have right links in the layout(Home)" do
			visit root_path
			click_link 'About'
				page.should have_selector('title',:text=>'Lets Tweet|About')
			click_link 'Contact'	
				page.should have_selector('title',:text=>'Lets Tweet|Contact Us')
			click_link 'Help'
				page.should have_selector('title',:text=>'Lets Tweet|Help')
			click_link 'Sign Up'
			 
				page.should have_selector('h1',:text=>'Login')
		end

end
