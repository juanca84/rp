class ReportsController < RunpaController
  load_and_authorize_resource class: "Register"
  before_filter :set_location

  def index
    @q = Register.valid.order('code ASC').search(params[:q])

    if params[:q].present?
      @department = params[:q][:lands_department_id_eq].present? && Department.find(params[:q][:lands_department_id_eq]).try(:name)
      @community = params[:q][:lands_community_id_eq].present? && Community.find(params[:q][:lands_community_id_eq]).try(:name)
      @partnership = params[:q][:partnerships_name_cont]
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
      wants.pdf do
        render pdf: "file_name", page_size: 'Letter'  
      end
    end
  end

  def set_location
    @departments = Department.all
    @communities = Community.all
  end
end