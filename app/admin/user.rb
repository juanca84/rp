ActiveAdmin.register User do
  index do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    column :roles do |u|
      u.roles_name.join(", ")
    end
    default_actions
  end

  filter :email
  filter :roles

  form do |f|
    f.inputs "Detalles de usuario" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :roles, as: :radio
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
    end
  end
end
