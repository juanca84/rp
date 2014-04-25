#encoding: utf-8
#metodo para actulizar las estados de los registros ya creados 
#este metodo solo fue necesario cuando se añadio los estados a los registros ya introducidos

namespace :db do
  desc "actulizacion de localidades de nacimiento"
  task :update_status_registers => :environment do
    #actualizamos el estado de los registros
    Register.all.each do |r|
      r.status  = 'active'
      if r.save
        puts "exito al actualizar el estatus del registro: #{ r.code }"
      else
        puts "se produjo un error al actualizar el status del registro codidog#{ r.code } id: #{ r.id }"
      end
    end
  end
end