class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  private
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

  def verify_normal
    if logged_in? && current_user.admin
      redirect_to admin_root_path
    end
  end
end
