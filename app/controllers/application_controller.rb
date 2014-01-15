class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_admin_user!
    redirect_to new_user_session_path unless current_user.try(:administrador?)
  end

  def access_denied(exception)
    redirect_to main_app.root_url, :alert => exception.message
  end
end
