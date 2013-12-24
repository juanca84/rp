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

    @holder1 = @register.people.build
    @holder1.people_registers.build(type_person: 'holder1')

    @holder2 = @register.people.build
    @holder2.people_registers.build(type_person: 'holder2')

    @son     = @register.people.build.people_registers.build(type_person: 'son')
    @attache = @register.people.build.people_registers.build(type_person: 'aggregate')

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
end
