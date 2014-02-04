class RegisterStepsController < ApplicationController
  include Wicked::Wizard
  steps :factors, :family, :partnerships,  :production

  def show
    @register = Register.find(params[:register_id])
    render_wizard
  end
end