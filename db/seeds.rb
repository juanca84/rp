# encoding: UTF-8
#creacion de la cuenta de administrador
administrador  = Role.where(name: 'administrador').first_or_create
agente_registrador = Role.where(name: 'agente registrador').first_or_create

module_formulario    = RunpaModule.where(name: 'formulario').first_or_create
module_administrador = RunpaModule.where(name: 'administrador').first_or_create
module_reportes      = RunpaModule.where(name: 'reportes').first_or_create
module_servicio_web  = RunpaModule.where(name: 'servicio_web').first_or_create

administrador.runpa_modules << module_formulario
administrador.runpa_modules << module_administrador
administrador.runpa_modules << module_reportes
administrador.runpa_modules << module_servicio_web

agente_registrador.runpa_modules << module_formulario

admin = User.create(email: "runpa.mdryt@gmail.com", password: "runpa1234", password_confirmation: "runpa1234")
if !admin.new_record? && admin.add_role("administrador")
  puts 'administrador creado! email -> runpa.mdryt@gmail.com y password -> runpa1234'
end