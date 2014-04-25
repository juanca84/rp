#encoding: utf-8
namespace :db do
  desc "actualizacion de Educations"
  task :add_data_tables => :environment do

    puts "creando registros para educación"
    Education.create(code: 1, name: 'Ninguno')
    Education.create(code: 2, name: 'Curso de alfabetización')
    Education.create(code: 3, name: 'Inicial (pre kínder, kínder)')
    Education.create(code: 4, name: 'Primaria')
    Education.create(code: 5, name: 'Secundaria')
    Education.create(code: 6, name: 'Técnico (Medio, Superior)')
    Education.create(code: 7, name: 'Normal')
    Education.create(code: 8, name: 'Universitario')
    Education.create(code: 9, name: 'Especialidad (maestría Doctorado)')
    Education.create(code: 10, name: 'Otro')

    puts "Creando registros para Actividad Economica"
    EconomicActivity.create(code: 1, name: "Agricultura")
    EconomicActivity.create(code: 2, name: "Ganadería")
    EconomicActivity.create(code: 3, name: "Avicultura")
    EconomicActivity.create(code: 4, name: "Apicultura")
    EconomicActivity.create(code: 5, name: "Forestal")
    EconomicActivity.create(code: 6, name: "Extracción o recolección de especies no maderables ")
    EconomicActivity.create(code: 7, name: "Caza")
    EconomicActivity.create(code: 8, name: "Pesca")
    EconomicActivity.create(code: 9, name: "Otros")

    puts "creando tablas para estado Civil"
    CivilStatus.create(code: 0, name: 'Soltero')
    CivilStatus.create(code: 1, name: 'Casado')
    CivilStatus.create(code: 2, name: 'Concubinato')
    CivilStatus.create(code: 3, name: 'Divorciado')
    CivilStatus.create(code: 4, name: 'Viudo')
  end
end