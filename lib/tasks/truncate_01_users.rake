#
# Modo de uso:
# bundle exec rake import:users
#
# esta tarea elimina todo los usuarios, perfiles y roles
# esta tarea ha sido desarrollada para la migracion del viejo sistema al nuevo
require 'csv'
namespace 'import' do
  desc "elimina a todos los usuarios"
  task :truncate_users => :environment do
    puts "vaciado de datos de usuarios, perfiles y roles"
    User.delete_all
    Profile.delete_all
    UsersRole.delete_all
  end
end