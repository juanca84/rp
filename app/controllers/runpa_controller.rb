class RunpaController < ActionController::Base
  before_filter :authenticate_user!
  layout "application"
end
