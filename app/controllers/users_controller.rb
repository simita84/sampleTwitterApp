class UsersController < ApplicationController
  

 def index
 end

  def new
  	@user=User.new
  end

  def show
  	#raise params.inspect
	@user=User.find(params[:id])

  end

  def create
    @user = User.new(params[:user])
      if @user.save
        redirect_to root_path
     
     else
         redirect_to signup_path
      end
  end


end
