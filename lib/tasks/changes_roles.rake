#encoding: utf-8
namespace :db do
  desc "actualizacion de roles"
  task :initilize_roles => :environment do
    administrador  = Role.where(name: 'administrador').first_or_create
    agente_registrador = Role.where(name: 'agente registrador').first_or_create

    module_formulario    = RunpaModule.where(name: 'formulario').first_or_create
    module_administrador = RunpaModule.where(name: 'administrador').first_or_create
    module_reportes      = RunpaModule.where(name: 'reportes').first_or_create
    module_servicio_web  = RunpaModule.where(name: 'servicio_web').first_or_create

    administrador.runpa_modules << module_formulario    unless administrador.module_formulario?
    administrador.runpa_modules << module_administrador unless administrador.module_administrador?
    administrador.runpa_modules << module_reportes      unless administrador.module_reportes?
    administrador.runpa_modules << module_servicios_web unless administrador.module_servicios_web?

    agente_registrador.runpa_modules << module_formulario unless agente_registrador.module_formulario?
    puts 'se crearon roles y modulos de RUNPA'
  end
end

