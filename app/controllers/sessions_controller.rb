class SessionsController < ApplicationController


#------------------------------Start User Sign In-----------------------------

 
  def new
    @user=User.new

  end


#User Sign In
	def create 
		

		#Find user with email id
		@user=User.find_by_email(params[:session][:email])	
		 

				#  password validation
				if @user&&@user.authenticate(params[:session][:password])
					#storing session info
		 			session[:user_id]=@user.id
		 			session[:username]=@user.email


		 			 

		 			 #Giving mesage of succesful login
					flash.now[:success]="Sign In Successful"
					   #directing to authorized pages
					redirect_to user_path(@user)
				else
					flash.now[:error]="Invalid password/email combination"
					render 'new'
				end	
			 
	end

#------------------------------End of  User Sign In-----------------------------

#------------------------------Start  of   User SignOut-----------------------------
	def destroy
		#storing session info
        session[:user_id]= nil
        session[:username]=nil
 
        flash[:success]=" Successfully logged out"
		redirect_to root_path
	end


end
