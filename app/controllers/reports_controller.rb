class ReportsController < RunpaController
  require 'iconv'
  load_and_authorize_resource class: "Register"
  before_filter :set_location

  def index
    @q = Register.valid.order('code ASC').search(params[:q])

    if params[:q].present?
      @department = params[:q][:lands_department_id_eq].present? && Department.find(params[:q][:lands_department_id_eq]).try(:name)
      @community = params[:q][:lands_community_id_eq].present? && Community.find(params[:q][:lands_community_id_eq]).try(:name)
      @partnership = params[:q][:partnership_productive_name_1_cont]
    end 
    @total_registers = @q.result(distinct: true).size

    @registers =
      if params[:format] == "pdf"
        @q.result(distinct: true).page params[:page]
      else
        @q.result(distinct: true).page params[:page]
      end

    respond_to do |wants|
      wants.html
      wants.pdf { render pdf: "file_name", page_size: 'Letter' }
      wants.csv do
        send_data Iconv.conv('iso-8859-1//IGNORE', 'utf-8', @registers.to_csv), 
          type: 'text/csv; charset=iso-8859-1; header=present',
          disposition: "attachment; filename=#{ DateTime.now.to_i }.csv" 
      end  
      wants.xls
    end
  end

  def set_location
    @departments = Department.all
    @communities = Community.all
  end
end