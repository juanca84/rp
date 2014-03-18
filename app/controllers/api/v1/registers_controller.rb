class Api::V1::RegistersController < ApplicationController

  def index
    params[:q][:holders_type_person_cont] = 'holder' if params[:q].present? &&  params[:q][:holders_person_name_cont].present?
    
    @q = Register.valid.order('code desc').search(params[:q])
    @registers = @q.result(distinct: true).includes(:user).page(params[:page]).per(10)

    respond_to do |wants|
      wants.html # index.html.erb
      wants.xml  { render :xml => @registers }
    end
  end

  def show
    options_includes = { holders: { person: [:education, :civil_status] }, sons: :person, aggregates: :person, lands: [:department, :community, :capitals, :productions] } 
    @register = Register.includes(options_includes).find(params[:id])

    respond_to do |wants|
      wants.html # show.html.erb
      wants.xml  { render :xml => @register }
    end 
  end

end