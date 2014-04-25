object @production

node(I18n.t("activerecord.attributes.production.department"))                          { |p| p.land.department.try(:name) }
node(I18n.t("activerecord.attributes.production.community"))                           { |p| p.land.community.try(:name) }
node(I18n.t("activerecord.attributes.production.entry"))                               { |p| p.entry }
node(I18n.t("activerecord.attributes.production.physical_coverage_amount"))            { |p| p.physical_coverage_amount }
node(I18n.t("activerecord.attributes.production.physical_coverage_unit"))              { |p| p.physical_coverage_unit }
node(I18n.t("activerecord.attributes.production.production_quantity"))                 { |p| p.production_quantity }
node(I18n.t("activerecord.attributes.production.production_unit"))                     { |p| p.production_unit }
node(I18n.t("activerecord.attributes.production.production_system"))                   { |p| p.production_system }
node(I18n.t("activerecord.attributes.production.production_destination"))              { |p| p.production_destination }

