# numero de mujeres y hombres
h = 0
f = 0
Register.all.each do |r|
  h += 1 if r.holder_main.sex  == "M"
  f += 1 if r.holder_main.sex  == "F"
end
h
f

#oecom oecas
oeca = []
oecom = []
p1 = []
p2 = []
Register.all.each do |r|
  oecom << r.try(:partnership).try(:name)
  oeca << r.try(:partnership).try(:community_name) 
  p1 << [r.id, r.try(:partnership).try(:productive_name_1)]
  p2 << [r.id, r.try(:partnership).try(:productive_name_2)]
end
#oeca
#oecom
p1
p2

#promedio tierra
total_sup = []
has = 0
m2 = 0
Register.all.each do |r|
  r.lands.each do |l|
    has += l.surface if l.unit_of_measure.include?("ha") 
    m2 += l.surface if l.unit_of_measure.include?("m") 
  end
end
has
m2
total = has*10000 + m2

total_personas = total/Register.all.size 

#promedio tierra
work = []
work_sum = 0
Register.all.each do |r|
  work << r.try(:work).try(:eventual_labor)
  work_sum += r.work.eventual_labor if r.try(:work).try(:eventual_labor).present?
end
work
work_sum

1p = 0
2p = 0
3p = 0

papa = 0
oca = 0
cebada = 0
haba = 0
quinua = 0  

has_papa = 0
papa = []
papalisa = []
oca = []
cebada = []
haba = []

  papa_has = 0 
  papa_m2 = 0

  papalisa_has = 0 
  papalisa_m2 = 0

  oca_has = 0 
  oca_m2 = 0

  cebada_has = 0 
  cebada_m2 = 0

  haba_has = 0 
  haba_m2 = 0
Production.all.each do |p|
  #has_papa += p.production_quantity if p.entry.include?("pap")
  #papa << p.entry if p.entry.include?("pap") && p.production_unit.include?("QQ")
  if p.entry.include?("papa")
    papa << [p.register.id, p.entry, p.physical_coverage_amount, p.physical_coverage_unit]
    papa_has += p.physical_coverage_amount if p.physical_coverage_unit.include?("ha")
    papa_m2 += p.physical_coverage_amount if p.physical_coverage_unit.include?("m2")
  end

  if p.entry.include?("papalisa")
    papalisa << [p.entry, p.physical_coverage_amount, p.physical_coverage_unit]
    papalisa_has += p.physical_coverage_amount if p.physical_coverage_unit.include?("ha")
    papalisa_m2 += p.physical_coverage_amount if p.physical_coverage_unit.include?("m2")
  end

  if p.entry.include?("oca")
    oca << [p.entry, p.physical_coverage_amount, p.physical_coverage_unit]
    oca_has += p.physical_coverage_amount if p.physical_coverage_unit.include?("ha")
    oca_m2 += p.physical_coverage_amount if p.physical_coverage_unit.include?("m2")
  end

  if p.entry.include?("cebad")
    cebada << [p.entry, p.physical_coverage_amount, p.physical_coverage_unit]
    cebada_has += p.physical_coverage_amount if p.physical_coverage_unit.include?("ha")
    cebada_m2 += p.physical_coverage_amount if p.physical_coverage_unit.include?("m2")
  end

  if p.entry.include?("haba")
    haba << [p.entry, p.physical_coverage_amount, p.physical_coverage_unit]
    haba_has += p.physical_coverage_amount if p.physical_coverage_unit.include?("ha")
    haba_m2 += p.physical_coverage_amount if p.physical_coverage_unit.include?("m2")
  end
end

papa
papa_has + papa_m2/10000.0

papalisa
papalisa_has + papa_m2/10000.0

oca
oca_has + oca_m2/10000.0

cebada
cebada_has + cebada_m2/10000.0

haba
haba_has + haba_m2/10000.0



##produccion porcentaje
papa = 0
oca = 0
cebada = 0
haba = 0
quinua = 0  

has_papa = 0
papa = []
papalisa = []
oca = []
cebada = []
haba = []

  papa_has = 0 
  papa_m2 = 0
  papa_consu = 0


  papalisa_has = 0 
  papalisa_m2 = 0
  papalisa_consu = 0

  oca_has = 0 
  oca_m2 = 0
  oca_consu = 0

  cebada_has = 0 
  cebada_m2 = 0
  cebada_consu = 0

  haba_has = 0 
  haba_m2 = 0
  haba_consu = 0
total = Register.all.size
Production.all.each do |p|
  if p.entry.include?("papa")
    papa << [p.register.id, p.entry, p.physical_coverage_amount, p.physical_coverage_unit, p.consumption]
    if p.consumption.present? && p.consumption >= 0
      papa_consu += p.consumption
    else
      papa_consu += 100
    end
  end

if p.entry.include?("oca")
    oca << [p.entry, p.physical_coverage_amount, p.physical_coverage_unit, p.consumption]
    if p.consumption.present? && p.consumption >= 0
      oca_consu += p.consumption
    else
      oca_consu += 100
    end    

  end

  if p.entry.include?("cebad")
    cebada << [p.entry, p.physical_coverage_amount, p.physical_coverage_unit, p.consumption]
    if p.consumption.present? && p.consumption >= 0
      cebada_consu += p.consumption
    else
      cebada_consu += 100
    end 
  end

  if p.entry.include?("haba")
    haba << [p.entry, p.physical_coverage_amount, p.physical_coverage_unit, p.consumption]
    if p.consumption.present? && p.consumption >= 0
      haba_consu += p.consumption
    else
      haba_consu += 100
    end 
  end


end
papa.size
papa_consu/papa.size
oca.size
oca_consu/oca.size
haba.size
haba_consu/haba.size
cebada.size
cebada_consu/cebada.size

a = []
alto = 0
g = []
grande = 0
c = []
centro = 0

Register.all.each do |r|
  if r.residence.include?("alt") 
    alto += 1 if r.residence.include?("alto")
  end
  if r.residence.include?("gra") || r.address.inclde?("GRAN")
        g << r.residence
    grande += 1 if r.residence.include?("grande")
  end
  if r.residence.include?("cen") || r.address.include?("centro") || r.residence.include?("CEN") || r.address.include?("CEN")
    c << r.residence
   centro += 1 if r.residence.include?("centro")
  end
end
a
alto
c
centro
g
grande

Register.all.map{|r| [r.residence, r.address]}


