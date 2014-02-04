class RegisterStepsController < ApplicationController
  include Wicked::Wizard
  steps :factors, :family, :partnerships,  :production

  def show
    render_wizard
  end
end