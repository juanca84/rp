class RegisterStepsController < ApplicationController
  include Wicked::Wizard
  steps :family, :partnerships, :factors, :production

  def show
    @register = Register.find params[:register_id]
    @step = params[:id]
    # case @step
    # # when :family
    # #when 'partnerships'
    # #  @register.partnerships.build
    # # when :factors
    # when 'production'
    #   #@register.lands.map{ |l| l.capitals.build }  
    #   #@register.lands.map{ |l| l.productions.build } 
    #   @register.lands.map{ |l| l.capitals.build }  
    #   @register.lands.map{ |l| l.productions.build }  
    # end
    render_wizard
  end
  
  def update
    #debugger
    @register = Register.find params[:register_id]
    @register.update_attributes params[:register]
    render_wizard @register
  end

  def finish_wizard_path
    @register = Register.find params[:register_id]
    register_path(@register)
  end
end