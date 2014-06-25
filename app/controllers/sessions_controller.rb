class SessionsController < ApplicationController



	def new
		@user =User.new
	end


	def create 
		user=User.find_by_email(params[:session][:email])
		
		if user&&user.authenticate(params[:session][:password])

			sign_in(user)

			flash.now[:success]="Sign In Successful"
			redirect_to user_path(user)
		else
			flash.now[:error]="Invalid password/email combination"
			render 'new'
		end	
	end

	def destroy
		sign_out
		redirect_to root_path
	end
end
