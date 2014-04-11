#encoding: utf-8
#metodo para actulizar la tabla works a la nueva estructura
# registers_1_________1_work
#este metodo solo fue necesario para y mantener la estructura de la base de datos

namespace :db do
  desc "actulizacion de los trabajos"
  task :update_works => :environment do
    #actualizamos el estado de los registros
    Register.active.each do |r|
      own_labor = r.total_time_to_land
      eventual_labor = 0
      permanent_labor = 0
      men_per_year_own = 0
      men_per_year_eventually = 0
      men_per_year_total = 0 
      r.lands.each do |l| 
        eventual_labor += l.eventual_labor if l.eventual_labor.present?
        permanent_labor += l.permanent_labor if l.permanent_labor.present?
      end
      men_per_year_own = own_labor.to_f/250
      men_per_year_eventually = eventual_labor.to_f/250
      men_per_year_total = men_per_year_own + men_per_year_eventually + permanent_labor
      work = 
        if r.work.present?
          r.work
        else
          r.build_work
        end
      if work.update_attributes({ own_labor: own_labor, eventual_labor: eventual_labor, permanent_labor: permanent_labor, men_per_year_own: men_per_year_own, men_per_year_eventually: men_per_year_eventually, men_per_year_total: men_per_year_total} )
        puts "actulizacion exitosa!!!  register: #{ r.id }, own_labor: #{ own_labor }, eventual_labor: #{ eventual_labor }, permanent_labor: #{ permanent_labor }, men_per_year_own: #{ men_per_year_own }, men_per_year_eventually: #{ men_per_year_eventually }, men_per_year_total: #{ men_per_year_total } " 
      else
        puts "error con el registro: #{ r.id }"
      end
    end
  end
end