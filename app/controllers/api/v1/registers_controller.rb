#encoding: UTF-8

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
    if User.verify_token(params[:token])
      @register = Register.find_by_code(params[:id])
      if  @register.present?
        render json: @register
      else
        render json: { success: false, message: "Error con código del registro" }, status: 401
        return  
      end
    else
      render json: { success: false, message: "Error con token" }, status: 401
    end
  end
end