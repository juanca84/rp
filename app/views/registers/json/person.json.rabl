object @person
attributes

node(I18n.t("activerecord.attributes.person.name"))           { |p| p.name }
node(I18n.t("activerecord.attributes.person.identification")) { |p| p.identification }
node(I18n.t("activerecord.attributes.person.birthdate"))      { |p| p.birthdate }
node(I18n.t("activerecord.attributes.person.sex"))            { |p| p.sex }
node(I18n.t("activerecord.attributes.person.education"))      { |p| p.education.try(:name) }
node(I18n.t("activerecord.attributes.person.civil_status"))   { |p| p.civil_status.try(:name) }
node(I18n.t("activerecord.attributes.person.age"))            { |p| p.age }
node(I18n.t("activerecord.attributes.person.phone"))          { |p| p.phone }
node(I18n.t("activerecord.attributes.person.birthplace"))     { |p| p.birthplace }