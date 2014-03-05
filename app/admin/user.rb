ActiveAdmin.register User do
  controller do
    def edit
      @user = User.find(params[:id])
      if @user.present? && @user.profile.blank?
        @user.build_profile
      end
    end

    def new
      @user = User.new
      @user.build_profile
    end

    def update_resource(object, attributes)
      update_method = attributes.first[:password].present? ? :update_attributes : :update_without_password
      object.send(update_method, *attributes)
    end

    def show
      @user = User.find(params[:id])
      @dates = @user.registers.valid.order("DATE(created_at)").group("DATE(created_at)").count
    end
  end

  index do
    column :email
    column :roles do |u|
      u.roles_name.join(", ")
    end
    column :active do |u|
      u.active? ? "Si" : "No"
    end
    column :number_of_ballots do |u|
      u.registers.valid.size
    end
    column :sign_in_count
    column :last_seen_at
    column :departments do |u|
      u.departments.pluck(:name).join(", ")
    end
    default_actions
  end

  filter :email
  filter :roles
  filter :departments
  
  form partial: "form"

  show title: "usuario" do |u|
    attributes_table  do
      row :email
      row :full_name do |u|
        u.full_name
      end
      row :active do |u|
        u.active? ? "Si" : "No"
      end  
      row :sign_in_count
      row :created_at
      row :last_seen_at
      row :roles do
        u.roles_name.join(", ")
      end
      if u.module_formulario?
        row :number_of_ballots do 
          u.registers.valid.size
        end 
      end
      row :departments do |u|
        u.departments.pluck(:name).join(", ")
      end
    end

    render 'show'
  end
end
