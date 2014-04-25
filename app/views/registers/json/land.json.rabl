object @land

node(I18n.t("activerecord.attributes.land.department"))        { |p| p.department.try(:name) }
node(I18n.t("activerecord.attributes.land.community"))         { |p| p.community.try(:name) }
node(I18n.t("activerecord.attributes.land.another_community")) { |p| p.another_community }
node(I18n.t("activerecord.attributes.land.surface"))           { |p| p.surface }
node(I18n.t("activerecord.attributes.land.unit_of_measure"))   { |p| p.unit_of_measure }
node(I18n.t("activerecord.attributes.land.tenure"))            { |p| p.tenure }
node(I18n.t("activerecord.attributes.land.disassemble_without_permission")) do |p| 
  p.disassemble_without_permission ? 'Si' : 'No'
end