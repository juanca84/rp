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
    { code: '1', name: 'FAO' },
    { code: '2', name: 'OAP- MDRyT' }
  ]
entities.each do |cs|
  entity = { code: cs[:code], business_name: cs[:name] }
  en = Entity.find_or_create_by_code_and_business_name(entity)
end

puts "inicializando actividades economicas"
economic_activities = 
  [
    { code: '9', name: 'OTROS' },
    { code: '8', name: 'PESCA' },
    { code: '7', name: 'CAZA' },
    { code: '6', name: 'EXTRACCIÓN O RECOLECCIÓN DE ESPECIES NO MADERABLES' },
    { code: '5', name: 'FORESTAL' },
    { code: '4', name: 'APICULTURA' },
    { code: '3', name: 'AVICULTURA' },
    { code: '2', name: 'GANADERÍA' },
    { code: '1', name: 'AGRICULTURA' }
  ]
economic_activities.each do |cs|
  economic_activity = { code: cs[:code], name: cs[:name] }
  en = EconomicActivity.find_or_create_by_code_and_name(economic_activity) 
end

puts "inicializando escolaridades"
educations = 
  [
    { code: '6', name: 'UNIVERSITARIO' },
    { code: '5', name: 'TÉCNICO/NORMAL(MEDIO, SUPERIOR)' },
    { code: '4', name: 'SECUNDARIA' },  
    { code: '3', name: 'PRIMARIA' },
    { code: '2', name: 'CURSO DE ALFABETIZACIÓN' },
    { code: '1', name: 'NINGUNO' }
  ]
educations.each do |cs|
  education = { code: cs[:code], name: cs[:name] }
  en = Education.find_or_create_by_code_and_name(education) 
end

puts "inicializando tipos de identificación"
identifications = 
  [
    { code: '3', name: 'PASAPORTE' },
    { code: '2', name: 'RUC' },
    { code: '1', name: 'CÉDULA DE IDENTIDAD' }
  ]
identifications.each do |cs|
  identification = { code: cs[:code], name: cs[:name] }
  en = TypeOfIdentification.find_or_create_by_code_and_name(identification) 
end

puts "inicializando tipos de tipos de residencias"
type_residences = 
  [
    { code: '3', name: 'COMUNIDAD/LOCALIDAD/ESTANCIA/RANCHO' },
    { code: '2', name: 'CENTRO POBLADO(MUNICIPIO)' },
    { code: '1', name: 'CAPITAL DE DEPARTAMENTO(CIUDAD)' }
  ]
type_residences.each do |cs|
  type_residence = { code: cs[:code], name: cs[:name] }
  en = TypeResidence.find_or_create_by_code_and_name(type_residence) 
end

puts "inicializando tipos de administradores de los establecimientos productivos"
manager_types = 
  [
    { code: '1', name: 'ESPOSO/A' },
    { code: '2', name: 'HIJO/A' }
  ]
manager_types.each do |mt|
  manager_type = { code: mt[:code], name: mt[:name] }
  manager = ManagerType.find_or_create_by_code_and_name(manager_type) 
end