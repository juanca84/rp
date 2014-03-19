#encoding: UTF-8

class Api::V1::RegistersController < ApplicationController
  respond_to :json

  def index
    if User.verify_token(params[:token])
      @registers = params[:per_page].present? ? Register.page(params[:page]).per(params[:per_page]) : Register.page(params[:page]).per(50)
      if @registers.present?
        render inline: Rabl::Renderer.json(@registers, 'registers/json/registers')
      end
    else
      render json: { success: false, message: "Error con token" }, status: 401
    end
  end

  def show
    if User.verify_token(params[:token])
      @register = Register.find_by_code(params[:id])
      if  @register.present?
        #render 'registers/show'
        
        render inline: Rabl::Renderer.json(@register, 'registers/json/register')
      else
        render json: { success: false, message: "Error con código del registro" }, status: 401
        return  
      end
    else
      render json: { success: false, message: "Error con token" }, status: 401
    end
  end
end