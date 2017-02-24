class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

private
  def authenticate_worker
    if !current_worker
      flash[:notice] = "You must be logged in/registered to do that"
      redirect_to new_user_registration_path
    end
  end
end
