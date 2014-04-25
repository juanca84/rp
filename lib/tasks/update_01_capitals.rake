#encoding: utf-8
#metodo para actulizar la tabla capitales a la nueva estructura
# registers_1_________n_capitals
#este metodo solo fue necesario para y mantener la estructura de la base de datos

namespace :db do
  desc "actulizacion de las capitales"
  task :update_capitals => :environment do
    #actualizamos el estado de los registros
    Capital.all.each do |c|
      l = Land.find_by_id c.land_id
      if l.present?
        c.register_id = l.register.id
        c.department_id = l.department.id
        c.community_id = l.community_id
        if c.save
          puts "exito en la actulizacion!!! capital: #{ c.id }, register_id: #{ c.register_id }, department_id: #{ c.department_id }, community_id: #{ c.community_id }"
        else
          puts "un error ha ocurrido en la capital: #{ c.id }"
        end
      end
    end
  end
end