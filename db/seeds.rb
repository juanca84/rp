#creacion de la cuenta de administrador
admin = User.create(email: "runpa.mdryt@gmail.com", password: "runpa1234", password_confirmation: "runpa1234")
if !admin.new_record? && admin.add_role(:admin)
  puts 'administrador creado! email -> runpa.mdryt@gmail.com y password -> runpa1234'
end
