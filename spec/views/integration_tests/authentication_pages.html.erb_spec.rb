require 'spec_helper'


	
 describe "Authentication Pages" do
	subject {page}

 	describe "Sign In page"  do
		before{ visit signin_path }

		it {should have_selector('h1',:text=>'Sign In')}
		it {should have_selector('title',:text=>'Sign In')}

	end

 	
 end


