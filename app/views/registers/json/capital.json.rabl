object @work
node(I18n.t("activerecord.attributes.land.department"))              { |p| p.land.try(:department).try(:name) }
node(I18n.t("activerecord.attributes.land.community"))               { |p| p.land.try(:community).try(:name) }
node(I18n.t("activerecord.attributes.capital.own_labor"))               { |p| p.own_labor }
node(I18n.t("activerecord.attributes.land.eventual_labor"))          { |p| p.eventual_labor }
node(I18n.t("activerecord.attributes.land.permanent_labor"))         { |p| p.permanent_labor }
node(I18n.t("activerecord.attributes.land.men_per_year_own"))        { |p| p.men_per_year_own }
node(I18n.t("activerecord.attributes.land.men_per_year_eventually")) { |p| p.men_per_year_eventually }
node(I18n.t("activerecord.attributes.land.men_per_year_total"))      { |p| p.men_per_year_total }