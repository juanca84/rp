class RegistersController < ActionController::Base
  before_filter :authenticate_user!
  layout "application"

  def index
    @registers = Register.all

    respond_to do |wants|
      wants.html # index.html.erb
      wants.xml  { render :xml => @registers }
    end
  end

  def new
    @register = Register.new

    2.times{ @register.holders.build(type_person: 'holder').build_person }
    @register.holders.build(type_person: 'son').build_person
    @register.holders.build(type_person: 'aggregate').build_person

    respond_to do |wants|
      wants.html # new.html.erb
      wants.xml  { render :xml => @egister }
    end
  end

  def create
    @register = Register.new(params[:register])
    respond_to do |wants|
      if @register.save
        flash[:notice] = 'Register was successfully created.'
        wants.html { redirect_to(@register) }
        wants.xml  { render :xml => @register, :status => :created, :location => @register }
      else
        wants.html { render :action => "new" }
        wants.xml  { render :xml => @register.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @register = Register.find(params[:id])

    respond_to do |wants|
      wants.html # show.html.erb
      wants.xml  { render :xml => @register }
    end
  end
end
