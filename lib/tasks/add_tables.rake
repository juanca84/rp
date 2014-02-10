#encoding: utf-8
namespace :db do
  desc "actualizacion de Educations"
  task :add_data_tables => :environment do

    puts "creando tablas para educación"
    Education.create(code: 0, name: 'Analfabeto')
    Education.create(code: 1, name: 'Sabe leer y escribir')
    Education.create(code: 2, name: 'Primer grado incompleto')
    Education.create(code: 3, name: 'Primer grado completo')
    Education.create(code: 4, name: 'Segundo grado incompleto')
    Education.create(code: 5, name: 'Segun grado completo')
    Education.create(code: 6, name: 'Cursando tercer grado')
    Education.create(code: 7, name: 'Universitario')
    Education.create(code: 8, name: 'Postgrado')

    puts "creando tablas para estado Civil"
    CivilStatus.create(code: 0, name: 'Soltero')
    CivilStatus.create(code: 1, name: 'Casado')
    CivilStatus.create(code: 2, name: 'Concubinato')
    CivilStatus.create(code: 3, name: 'Divorciado')
    CivilStatus.create(code: 4, name: 'Viudo')
  end
end