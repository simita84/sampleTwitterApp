class ApplicationController < ActionController::Base
  protect_from_forgery
  
   

  #Confirming the user is logged in or authorized to view the pages
 
 #protected so that sub classes can access them


 private

    def current_user
      @current_user||=User.find(session[:user_id]) if session[:user_id]
      end
    helper_method :current_user 
 

  protected

  def confirm_user_logged_in
    unless current_user
      flash[:error]="Please login"
      redirect_to root_path
      return false #halts the before_filter  
    else
      return true
    end
  end
  
 
end
