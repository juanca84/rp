#encoding: utf-8
namespace :db do
  desc "actualizacion de roles"
  task :change_to_roles=> :environment do
    administrador  = Role.first_or_create(name: 'administrador')
    agente_registrador = Role.first_or_create(name: 'agente registrador')

    module_formulario  = RunpaModule.first_or_create(name: 'formulario')
    module_administrador = RunpaModule.first_or_create(name: 'administrador')

    administrador.runpa_modules << module_formulario
    administrador.runpa_modules << module_administrador

    agente_registrador.runpa_modules << module_formulario
  end
end

