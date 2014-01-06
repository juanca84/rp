ActiveAdmin.register Role do

  index do
    column :name
    column :runpa_modules do |u|
      u.runpa_modules.pluck(:name).join(", ")
    end
    column :created_at
    column :updated_at
   default_actions
  end

  form do |f|
    f.inputs "Roles de usuario" do
      f.input :name
      f.input :runpa_modules, as: :check_boxes
    end
    f.actions
  end
end
