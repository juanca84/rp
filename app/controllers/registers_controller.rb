class RegistersController < RunpaController
  load_and_authorize_resource except: [:get_communities, :registers_no_valids]
  before_filter :registers_no_valids, only: [:index, :new, :edit, :show]

  def index
    params[:q][:holders_type_person_cont] = 'holder' if params[:q].present? &&  params[:q][:holders_person_name_cont].present?
    
    @q = Register.valid.order('code desc').search(params[:q])
    @registers = @q.result(distinct: true).includes(:user).page(params[:page]).per(10)

    respond_to do |wants|
      wants.html # index.html.erb
      wants.xml  { render :xml => @registers }
    end
  end

  def new
    @register = Register.new(user_id: current_user.id)

    2.times{ @register.holders.build(type_person: 'holder').build_person }

    respond_to do |wants|
      wants.html # new.html.erb
      wants.xml  { render :xml => @egister }
    end
  end

  def edit
    @register = Register.find(params[:id])
    @register_no_valids -= [@register]
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
    options_includes = { holders: { person: [:education, :civil_status] }, sons: :person, lands: [:department, :community, :capitals, :productions] } 
    @register = Register.includes(options_includes).find(params[:id])

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

  def get_communities
    @department = Department.find_by_id(params[:id])
    @communities = @department.communities
    render layout: false
  end

  def registers_no_valids
    @register_no_valids = Register.no_valid.by_user(current_user)
  end

  def versions
    @register = Register.find(params[:id])
    @versions = @register.versions
  end
end