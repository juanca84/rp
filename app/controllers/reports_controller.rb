class ReportsController < RunpaController
  load_and_authorize_resource class: "Register"

  def index  
    @q = Register.search(params[:q])
    @registers = @q.result(distinct: true).page params[:page]

    respond_to do |wants|
      wants.html
      wants.pdf do
        render :pdf => "file_name"
      end
    end
  end
end