object @capital
node(I18n.t("activerecord.attributes.capital.department"))      { |p| p.land.try(:department).try(:name) }
node(I18n.t("activerecord.attributes.capital.community"))       { |p| p.land.try(:community).try(:name) }
node(I18n.t("activerecord.attributes.capital.capital_item"))    { |p| p.capital_item }
node(I18n.t("activerecord.attributes.capital.start_year"))      { |p| p.start_year }
node(I18n.t("activerecord.attributes.capital.lifespan_future")) { |p| p.lifespan_future }
node(I18n.t("activerecord.attributes.capital.current_value"))   { |p| p.current_value }