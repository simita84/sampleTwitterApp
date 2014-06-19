require 'spec_helper'

describe "Static Pages of the Site" do

	describe "Home Page" do

		it "should have ' Twitter Sample App as title' " do
			visit root_path
			page.should have_selector('title',
				:text=>'Lets Tweet|Home')
			
		end


		it "should have 'h1 selector as 'Sample Twitter Application' " do
			visit root_path
			page.should have_selector('h1',
				:text=>'Welcome')

		end
	end
   
describe "Help Page" do

		it "should have ' Help Page title' " do
			visit help_path
			page.should have_selector('title',
				:text=>'Lets Tweet|Help')
		end
	end

describe "About Us Page" do

		it "should have ' Lets Tweet|About Us title' " do
			visit about_path
			page.should have_selector('title',
				:text=>'Lets Tweet|About Us')
		end
	end


describe "Contact US page" do
 
 	it "should have Lets Tweet|Contact Us title" do 
 		visit contact_path
 		page.should have_selector('title',:text=>'Lets Tweet|Contact Us')
 	end
 	it "should have 'h1 selector as 'Contact Us' " do
			visit contact_path
			page.should have_selector('h1',
				:text=>'Contact Us')

		end

end



end
