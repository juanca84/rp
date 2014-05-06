ActiveAdmin.register Register do
	csv do
    column "code"
    column "created_at"
    column "updated_at"
    column "residence"
    column "address"
    column("department") { |r| r.try(:department).try(:name) }
    column("community")  { |r| r.try(:community).try(:name) }
    column("user")       { |r| r.try(:community).try(:name) }
    column "emission_date"
    column("emission_department") { |r| r.try(:emission_department).try(:name) }
    column("emission_community")  { |r| r.try(:emission_community).try(:name) }
    column "status"
    column "activation_date"
    column "is_owner"
	end

	before_filter only: :index do
	  @per_page = 10_000 if request.format == 'text/csv'
	end
	scope :valid, default: true
end