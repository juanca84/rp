#encoding: utf-8
#metodo para actulizar la tabla produciones a la nueva estructura
# registers_1_________n_productions
#este metodo solo fue necesario para y mantener la estructura de la base de datos

namespace :db do
  desc "actulizacion de las capitales"
  task :update_productions => :environment do
    #actualizamos el estado de los registros
    Production.all.each do |p|
      l = Land.find_by_id p.land_id
      if l.present?
        p.register_id = l.register.id
        p.department_id = l.department.id
        p.community_id = l.community_id
        if p.save
          puts "exito en la actulizacion!!! producción: #{ p.id }, register_id: #{ p.register_id }, department_id: #{ p.department_id }, community_id: #{ p.community_id }"
        else
          puts "un error ha ocurrido en la produción: #{ p.id }"
        end
      end
    end
  end
end