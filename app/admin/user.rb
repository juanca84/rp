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
end
