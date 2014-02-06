class RegistersController < RunpaController
  load_and_authorize_resource
  
  def index
    @registers = Register.order('code asc').page params[:page]

    respond_to do |wants|
      wants.html # index.html.erb
      wants.xml  { render :xml => @registers }
    end
  end

  def new
    @register = Register.new(code: Register.new_code_number, user_id: current_user.id)

    2.times{ @register.holders.build(type_person: 'holder').build_person }

    respond_to do |wants|
      wants.html # new.html.erb
      wants.xml  { render :xml => @egister }
    end
  end

  def edit
    @register = Register.find(params[:id])
  end

  def create
    @register = Register.new(params[:register])
    if @register.save
      redirect_to register_register_step_path(@register, :family)
      #flash[:notice] = 'Register was successfully created.'
      #wants.html { redirect_to(@register) }
      #wants.xml  { render :xml => @register, :status => :created, :location => @register }
    else
      respond_to do |wants| 
        wants.html { render :action => "new" }
        wants.xml  { render :xml => @register.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @register = Register.find(params[:id])
    
    if @register.update_attributes(params[:register])
      redirect_to register_register_step_path(@register, :family)
      #flash[:notice] = 'Register was successfully updated.'
      #wants.html { redirect_to(@register) }
      #wants.xml  { head :ok }
    else
      respond_to do |wants|
        wants.html { render :action => "edit" }
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

  def destroy
    @register = Register.find(params[:id])
    @register.destroy

    respond_to do |wants|
      wants.html { redirect_to(registers_url) }
      wants.xml  { head :ok }
    end
  end
end
