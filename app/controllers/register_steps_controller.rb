class RegisterStepsController < ApplicationController
  include Wicked::Wizard
  steps :family, :partnerships, :factors, :production

  def show
    @register = Register.find params[:register_id]
    @step = params[:id]
    case @step
    when 'production'
      @register.emission_date = Date.today if @register.emission_date.blank?
    end
    render_wizard
  end
  
  def update
    @register = Register.find params[:register_id]

    step  = params[:id]
    case step
    when 'family'
      @register.fill_family if @register.may_fill_family?
    when 'partnerships'
      @register.fill_partnership if @register.may_fill_partnership?
    when 'factors'
      @register.fill_factors if @register.may_fill_factors?
    when 'production'
      @register.finish if @register.may_finish?
    end

    @register.update_attributes params[:register]
    render_wizard @register
  end

  def finish_wizard_path
    @register = Register.find params[:register_id]
    register_path(@register)
  end
end