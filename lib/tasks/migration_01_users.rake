
#
# Modo de uso:
# bundle exec rake import:users
#
# En application.rb añadir la librería para leer CSV:
# require 'csv'
#
require 'csv'
namespace 'import' do
  desc "import users old system"
  task :users => :environment do
    CSV.foreach("#{ Rails.root }/lib/tasks/old_registers/01_users.csv", headers: true) do |row|
      #puts "#{ row['Email']} #{ row['Encrypted Password'] }"
      user = User.new({ 
                        email: row['Email'],
                        password: row['profile_identification'].present? ? row['profile_identification'] : 'runpa1234',
                        sign_in_count: row['Sign In Count'],
                        current_sign_in_at: row['Current Sign In At'],
                        last_sign_in_at: row['Last Sign In At'],
                        current_sign_in_ip: row['Current Sign In Ip'],
                        created_at: row['created At'],
                        updated_at: row['Updated At'],
                        last_seen_at: row['Last Seen At'],
                        active: row['Active'],
                        entity_id: Entity.find_by_business_name(row['entity']).try(:id),
                        profile_attributes: {
                          name: row['profile_name'],
                          last_name: row['profile_last_name'],
                          second_last_name: row['profile_last_name'],
                          identification: row['profile_identification'],
                          sex: row['profile_sex'],
                          created_at: row['profile_created_at'],
                          updated_at: row['profile_updated_at']
                        }
                      })
      if user.save
        row['role'].split(",").map{|role|  user.add_role role }
        puts "El usuario fue creado exitosamente: #{ user.inspect }" 
      else
        puts "Se ha producido los siguientes errores: #{ user.errors.inspect }"
      end  
    end
  end
end
