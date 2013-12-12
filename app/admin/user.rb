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
end
