#encoding: utf-8
#metodo para actulizar las localidades de nacimiento

namespace :db do
  desc "actulizacion de las fechas de activacion de los registros"
  task puts_activation_date: :environment do
    Register.active.each do |register|
      unless register.activation_date.present?
        if register.update_attribute( :activation_date, register.updated_at )
          puts "Se actualizo exitosamente el registro: #{ register.code } " 
        else
          puts "Se produjo un error al actulizar el registro: #{ register.code } " 
        end
      end
    end
  end
end