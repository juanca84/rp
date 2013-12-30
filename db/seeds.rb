# encoding: UTF-8
#creacion de la cuenta de administrador
admin = User.create(email: "runpa.mdryt@gmail.com", password: "runpa1234", password_confirmation: "runpa1234")
if !admin.new_record? && admin.add_role("administrador")
  puts 'administrador creado! email -> runpa.mdryt@gmail.com y password -> runpa1234'
end

Role.create(name: "administrador")
Role.create(name: "encuestador")

Department.create(
  [
    { code: 1, name: "Beni" },
    { code: 2, name: "Chuquisaca" },
    { code: 3, name: "Cochabamba" },
    { code: 4, name: "La Paz" },
    { code: 5, name: "Oruro" },
    { code: 6, name: "Pando" },
    { code: 7, name: "Potosí" },
    { code: 8, name: "Santa Cruz" },
    { code: 9, name: "Tarija" }
  ]
)
