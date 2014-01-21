ActiveAdmin.register User do
  controller do
    def new
      @user = User.new
      @user.build_profile
    end

    def update_resource(object, attributes)
      update_method = attributes.first[:password].present? ? :update_attributes : :update_without_password
      object.send(update_method, *attributes)
    end
  end

  index do
    column :email
    column :roles do |u|
      u.roles_name.join(", ")
    end
    column :created_at
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
      row :sign_in_count
      row :created_at
      row :last_seen_at
      row :roles do
        u.roles_name.join(", ")
      end
      row :departments do |u|
        u.departments.pluck(:name).join(", ")
      end
    end
  end
end
