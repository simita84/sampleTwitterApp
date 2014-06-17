require 'spec_helper'

describe "Static Pages of the Site" do

	describe "Home Page" do

		it "should have ' Twitter Sample App as title' " do
			visit "/static_pages/home"
			page.should have_selector('title',
				:text=>'Lets Tweet|Home')
			
		end


		it "should have 'h1 selector as 'Sample Twitter Application' " do
			visit "/static_pages/home"
			page.should have_selector('h1',
				:text=>'Welcome')

		end
	end
   
describe "Help Page" do

		it "should have ' Help Page title' " do
			visit "/static_pages/help"
			page.should have_selector('title',
				:text=>'Lets Tweet|Help')
		end
	end

describe "About Us Page" do

		it "should have ' Lets Tweet|About Us title' " do
			visit "/static_pages/about"
			page.should have_selector('title',
				:text=>'Lets Tweet|About Us')
		end
	end


describe "Contact US page" do
 
 	it "should have Lets Tweet|Contact Us title" do 
 		visit "/static_pages/contact"
 		page.should have_selector('title',:text=>'Lets Tweet|Contact Us')
 	end
 	it "should have 'h1 selector as 'Contact Us' " do
			visit "/static_pages/contact"
			page.should have_selector('h1',
				:text=>'Contact Us')

		end

end



end
