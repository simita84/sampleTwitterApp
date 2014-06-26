class UsersController < ApplicationController
  
before_filter :confirm_user_logged_in,:except => [:new,:create]
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
  
       #storing session info
      session[:user_id]=@user.id
      session[:username]=@user.email
       #Giving mesage of succesful login
      flash[:success]="Welcome #{@user.name}"

      
         #directing to authorized pages
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
