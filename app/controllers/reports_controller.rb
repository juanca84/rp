class ReportsController < RunpaController
  load_and_authorize_resource class: "Register"

  def index
    @q = Register.valid.order('code desc').search(params[:q])

    @registers =
      if params[:format] == "pdf"
        @q.result(distinct: true)
      else 
        @q.result(distinct: true).page params[:page]
      end

    respond_to do |wants|
      wants.html
      wants.pdf do
        render :pdf => "file_name"
      end
    end
  end
end