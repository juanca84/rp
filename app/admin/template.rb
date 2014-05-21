#encoding: UTF-8
ActiveAdmin.register Template do

  form do |f|
    f.inputs "Detalles de la plantilla" do
      f.input :user_id, as: :hidden, input_html: { value: current_user.id }
      f.input :description
    end

    f.inputs "LUGAR DE REGISTRO" do
      f.input :department
      f.input :province
      f.input :community
      f.input :type_residence
      f.input :residence
    end

    f.inputs "ASOCIACIÓN" do
      f.input :oecom_name
      f.input :legal_status_oecom
      f.input :greater_oecom_name
    end
    f.actions
  end

end