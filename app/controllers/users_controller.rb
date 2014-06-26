class UsersController < ApplicationController
  

 def index
 end

  

  def show
  	#raise params.inspect
	@user=User.find(params[:id])

  end

  def new
  @user= User.new
  end

  def create
    @user = User.new(params[:user])
      if @user.save
        sign_in(@user)
        flash[:success]="Welcome #{@user.name}"
        redirect_to user_path(@user)
     else
        flash[:warning]="User not created"
        redirect_to signup_path
      end
  end


  def edit
    @user= User.find_by_id(params[:id])

  end

  def update
      @user= User.find_by_id(params[:id])
      @user.update_attributes(params[:user])
       if @user.save
         flash[:success]="Successfully modified"
        redirect_to user_path(@user)
       else
        flash[:warning]="Sorry cannot be modified"
       render "edit"
     end

  end


end
