class RunpaController < ActionController::Base
  load_and_authorize_resource
  before_filter :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :alert => exception.message
  end

  layout "application"
end
