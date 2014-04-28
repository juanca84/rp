# encoding: UTF-8

#creacion de roles
administrador  = Role.where(name: 'administrador').first_or_create
agente_registrador = Role.where(name: 'agente registrador').first_or_create

module_formulario    = RunpaModule.where(name: 'formulario').first_or_create
module_administrador = RunpaModule.where(name: 'administrador').first_or_create
module_reportes      = RunpaModule.where(name: 'reportes').first_or_create
module_servicio_web  = RunpaModule.where(name: 'servicio_web').first_or_create

administrador.runpa_modules << module_formulario unless administrador.runpa_modules.include?(module_formulario)
administrador.runpa_modules << module_administrador unless administrador.runpa_modules.include?(module_administrador)
administrador.runpa_modules << module_reportes unless administrador.runpa_modules.include?(module_reportes)
administrador.runpa_modules << module_servicio_web unless administrador.runpa_modules.include?(module_servicio_web)
agente_registrador.runpa_modules << module_formulario unless administrador.runpa_modules.include?(module_formulario)

#creacion de la cuenta de administrador
admin = User.create(email: "runpa.mdryt@gmail.com", password: "runpa1234", password_confirmation: "runpa1234")
if !admin.new_record? && admin.add_role("administrador")
  puts 'administrador creado! email -> runpa.mdryt@gmail.com y password -> runpa1234'
end


puts "inicializando estados civiles"
civil_status = 
  [
    { code: '4', name: 'VIUDO' },
    { code: '3', name: 'DIVORCIADO' },
    { code: '2', name: 'CONCUBINATO' },
    { code: '1', name: 'CASADO' },
    { code: '0', name: 'SOLTERO' }
  ]
civil_status.each do |cs|
  civil_status = { code: cs[:code], name: cs[:name] }
  civil = CivilStatus.find_or_create_by_code_and_name(civil_status) 
end

puts "inicializando entidades"
entities = 
  [
    { name: 'FAO' },
    { name: 'OAP- MDRyT' }
  ]
entities.each do |cs|
  entity = { code: cs[:code], name: cs[:name] }
  en = CivilStatus.find_or_create_by_code_and_name(entity) 
end