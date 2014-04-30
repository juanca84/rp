ActiveAdmin.register Register do
	before_filter only: :index do
	  @per_page = 10_000 if request.format == 'text/csv'
	end
end
