#encoding: utf-8
namespace :db do
  desc "actualizacion de roles"
  task :change_to_roles=> :environment do
    administrador  = Role.where(name: 'administrador').first_or_create
    agente_registrador = Role.where(name: 'agente registrador').first_or_create

    module_formulario  = RunpaModule.where(name: 'formulario').first_or_create
    module_administrador = RunpaModule.where(name: 'administrador').first_or_create

    administrador.runpa_modules << module_formulario
    administrador.runpa_modules << module_administrador

    agente_registrador.runpa_modules << module_formulario
    puts 'se crearon roles y modulos de RUNPA'
  end
end

