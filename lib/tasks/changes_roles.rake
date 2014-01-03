#encoding: utf-8
namespace :db do
  desc "cambio de roles"
  task :change_roles=> :environment do
    Role.create([{ name: 'administrador' }, { name: 'agente registrador' }])
  end
end

