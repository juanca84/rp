object @register

node(I18n.t("activerecord.attributes.register.code"))                { |p| p.code }
node(I18n.t("activerecord.attributes.register.residence"))           { |p| p.residence }
node(I18n.t("activerecord.attributes.register.address"))             { |p| p.code }

node(I18n.t("activerecord.attributes.register.department"))          { |p| p.department.try(:name) }
node(I18n.t("activerecord.attributes.register.community"))           { |p| p.community.try(:name) }
node(I18n.t("activerecord.attributes.register.geodesic_ns"))         { |p| p.geodesic_ns }
node(I18n.t("activerecord.attributes.register.geodesic_ew"))         { |p| p.geodesic_ew }
node(I18n.t("activerecord.attributes.register.code_ine"))            { |p| p.code_ine }

node(I18n.t("activerecord.attributes.register.economic_activity"))   { |p| p.economic_activity.try(:name) }
node(I18n.t("activerecord.attributes.register.first_entry"))         { |p| p.first_entry }
node(I18n.t("activerecord.attributes.register.second_entry"))        { |p| p.second_entry }

node(I18n.t("activerecord.attributes.register.emission_date"))       { |p| p.emission_date }
node(I18n.t("activerecord.attributes.register.emission_department")) { |p| p.emission_department.try(:name) }
node(I18n.t("activerecord.attributes.register.emission_community"))  { |p| p.emission_community.try(:name) }

child holders: I18n.t("activerecord.models.holder") do
  extends "registers/json/people_register"
end

child sons: I18n.t("activerecord.models.son") do
  extends "registers/json/people_register"
end

child aggregates: I18n.t("activerecord.models.aggregate") do
  extends "registers/json/people_register"
end