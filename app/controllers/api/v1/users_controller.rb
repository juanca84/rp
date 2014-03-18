class Api::V1::UsersController < ApplicationController
  respond_to :json

  def get_token
    user = User.find_by_email(params[:email])
    if user.present? && user.valid_password?(params[:password])
      if (token = user.get_authentication_token(params[:password])).present?
        render json: { token: token }, status: 200
        return
      else
        render json: { success: false, message: "No tiene los permisos suficientes." }, status: 401
        return
      end
    else
      render json: { success: false, message: "Error con su email o password." }, status: 401
    end
  end

  def new_token
    user = User.find_by_email(params[:email])
    if user.present? && user.valid_password?(params[:password])
      if user.active?  && user.module_servicio_web? && user.new_authentication_token && (token = user.get_authentication_token(params[:password])).present?
        render json: { token: token }, status: 200
        return
      else
        render json: { success: false, message: "No tiene los permisos suficientes." }, status: 401
        return
      end
    else
      render json: { success: false, message: "Error con su email o password." }, status: 401
    end
  end

end