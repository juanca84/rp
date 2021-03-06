class RegisterStepsController < ApplicationController
  before_filter :registers_no_valids, only: :show

  include Wicked::Wizard
  steps :family, :partnerships, :factors, :production

  def show
    @register = Register.find params[:register_id]
    @register_no_valids -= [@register]
    @step = params[:id]

    case @step
    when 'family'
      render_wizard and return
    when 'partnerships'
      if @register.active? || @register.inactive? || @register.step_family? || @register.step_partnership? || @register.step_factors?
        render_wizard and return
      else
        redirect_to edit_register_path(@register)
      end  
    when 'factors'
      if @register.active? || @register.inactive? || @register.step_partnership? || @register.step_factors?
        render_wizard and return
      else
        redirect_to edit_register_path(@register)
      end 
    when 'production'
      if @register.active? || @register.inactive? || @register.step_factors?
        @register.emission_date = Date.today if @register.emission_date.blank?
        render_wizard and return
      else
        redirect_to edit_register_path(@register)
      end 
    when 'wicked_finish'
      if @register.active? || @register.inactive?
        render_wizard and return
      else
        redirect_to edit_register_path(@register)
      end 
    end
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
      @register.activate if @register.may_activate?
    end

    @register.update_attributes params[:register]
    render_wizard @register
  end

  def finish_wizard_path
    @register = Register.find params[:register_id]
    register_path(@register)
  end

  def registers_no_valids
    @register_no_valids = Register.no_valid.by_user(current_user)
  end
end