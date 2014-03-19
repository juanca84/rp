object @people_register
attributes

node(I18n.t("activerecord.attributes.people_register.type_person")) do |p|
  p.type_person == 'holder' ? 'Titular' : p.type_person == 'son' ? 'Hijo' : p.type_person == 'aggregate' ? 'Agregado' :''
end

child :person do
  extends "registers/json/person"
end

node(I18n.t("activerecord.attributes.people_register.time_to_land")) { |p| p.time_to_land }