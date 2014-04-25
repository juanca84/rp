#encoding: utf-8
#metodo para actulizar las localidades de nacimiento

namespace :db do
  desc "actulizacion de localidades de nacimiento"
  task :update_birthplaces => :environment do
    Person.all.each do |p|
      if p.community_of_birth.present? && p.community_of_birth.name.present?
        p.birthplace = p.community_of_birth.name.upcase
        if p.save
          puts 'exito al actualizar localidad de nacimiento'
        else
          puts 'se produjo un error al actualizar localidad de nacimiento'
        end
      end
    end
  end
end