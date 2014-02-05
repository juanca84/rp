class RegisterStepsController < ApplicationController
  include Wicked::Wizard
  steps :family, :partnerships, :factors, :production

  def show
    @register = Register.find params[:register_id]
    @step = params[:id]
    render_wizard
  end
  
  def update
    @register = Register.find params[:id] 
    @user.update_attributes params[:register]
    case step
    when :family
    when :partnerships
    when :factors
    when :production
    end
    render_wizard @user
  end

  def finish_wizard_path
    @register = Register.find params[:id]
    register_path(@register)
  end
end