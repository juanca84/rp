#encoding: utf-8
#metodo para actulizar la tabla partnerships a la nueva estructura
# registers_1_________1_partnership
#este metodo solo fue necesario para y mantener la estructura de la base de datos

namespace :db do
  desc "actulizacion de las asociaciones"
  task :update_partnerships => :environment do
    Register.active.each do |r|
      partnership = (p = r.partnership).present? ? p : r.build_partnership 
      if partnership.update_attributes({ productive_name_1: partnership.name, economic_activity_1_id: r.economic_activity_id, first_entry_1: r.first_entry, second_entry_1: r.second_entry } )
        puts "actulizacion exitosa!!!  register: #{ r.id }, productive_name_1: #{ partnership.name }, economic_activity_1_id: #{ r.economic_activity_id }, first_entry_1: #{ r.first_entry }, second_entry_1: #{ r.second_entry } " 
      else
        puts "error con el registro: #{ r.id }"
      end
    end
  end
end