ActiveAdmin.register User do
  index do
    column :email
    column :created_at
    column :sign_in_count
    column :last_seen_at
    column :roles do |u|
      u.roles_name.join(", ")
    end
    column :departments do |u|
      u.departments.pluck(:name).join(", ")
    end
    default_actions
  end

  filter :email
  filter :roles
  filter :departments

  form do |f|
    f.inputs "Detalles de usuario" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :roles, as: :radio
      f.input :departments, as: :check_boxes
    end
    f.actions
  end

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
