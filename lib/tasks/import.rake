##
# lib/tasks/import.rb
#
# Modo de uso:
# bundle exec rake import:dep_prov_mun
#
# En application.rb añadir la librería para leer CSV:
# require 'csv'
#
# El archivo "codigos.csv" tiene que estar en el root de la aplicación, o cambiar de acuerdo a preferencias.
#
# La tabla "departments" tiene que tener los campos: code:string, name:string
# La tabla "provinces" tiene que tener los campos: code:string, name:string, department_id:integer
# La tabla "section_municipals" tiene que tener los campos: code:string, name:string, province_id:integer
#
require 'csv'
namespace 'import' do
  desc "import department, province, and section municipal"
  task :dep_prov_mun => :environment do
    CSV.foreach("#{ Rails.root }/lib/tasks/codigos.csv", headers: true) do |row|
      department = { code: row["COD_DEP"], name: row["NOM_DEP"] }
      d = Department.find_or_create_by_code_and_name(department)

      province = { code: row["COD_PROV"], name: row["NOM_PROV"], department_id: d.id }
      p = Province.find_or_create_by_code_and_name_and_department_id(province)

      municipio = { code: row["COD_MUN"], name: row["NOM_MUN"], province_id: p.id}
      s = Community.find_or_create_by_code_and_name_and_province_id(municipio)

      puts s.inspect
    end
  end
end
