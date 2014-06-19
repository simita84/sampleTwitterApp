require 'spec_helper'

describe "User Pages" do

		subject {page}

	before{ visit signup_path }
	
	describe "User Sign Up" do	
			it {should have_selector('title', :text=>'Sign Up') }
			it {should have_selector('h1',    :text=>'Login')   }
	end
  
end
