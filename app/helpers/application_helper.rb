module ApplicationHelper
  #metodo para asignar el estilo al mensaje correspondiente
  def bootstrap_class_for flash_type
    case flash_type
    when :success
      "alert-success" #Verde
    when :error
      "alert-danger" #Rojo
    when :alert
      "alert-warning" #amarillo
    when :notice
      "alert-info" #azul
    else
      flash_type.to_s
    end
  end
end
