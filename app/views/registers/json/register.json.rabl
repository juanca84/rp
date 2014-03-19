object @register
attributes

node(I18n.t("activerecord.attributes.register.code"))                { |p| p.code }
node(I18n.t("activerecord.attributes.register.residence"))           { |p| p.residence }
node(I18n.t("activerecord.attributes.register.address"))             { |p| p.code }
node(I18n.t("activerecord.attributes.register.department"))          { |p| p.department.name }
node(I18n.t("activerecord.attributes.register.community"))           { |p| p.community.name }
node(I18n.t("activerecord.attributes.register.geodesic_ns"))         { |p| p.geodesic_ns }
node(I18n.t("activerecord.attributes.register.geodesic_ew"))         { |p| p.geodesic_ew }
node(I18n.t("activerecord.attributes.register.code_ine"))            { |p| p.code_ine }

node(I18n.t("activerecord.attributes.register.economic_activity"))   { |p| p.economic_activity.name }
node(I18n.t("activerecord.attributes.register.first_entry"))         { |p| p.first_entry }
node(I18n.t("activerecord.attributes.register.second_entry"))        { |p| p.second_entry }

node(I18n.t("activerecord.attributes.register.emission_date"))       { |p| p.emission_date }
node(I18n.t("activerecord.attributes.register.emission_department")) { |p| p.emission_department.name }
node(I18n.t("activerecord.attributes.register.emission_community"))  { |p| p.emission_community.name }