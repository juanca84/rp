#encoding: UTF-8
ActiveAdmin.register Template do

  form do |f|
    f.inputs "Detalles de la plantilla" do
      f.input :user_id, as: :hidden, input_html: { value: current_user.id }
      f.input :active
      f.input :description
    end

    f.inputs "Titular: datos de lugar de nacimiento" do
      f.input :department_of_birth
      f.input :province_of_birth
      f.input :community_of_birth
    end

    f.inputs "Titular: datos de identificación" do
      f.input :issued
    end

    f.inputs "Titular: datos del lugar de residencia" do
      f.input :department
      f.input :community
      f.input :type_residence
      f.input :residence
    end

    f.inputs "Registro: datos del lugar y fecha de emisión" do
      f.input :emission_department
      f.input :emission_community
    end
    f.actions
  end


end
