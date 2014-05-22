class Runpa.Models.Person extends Backbone.Model
  validation:
    name:
      required: true
      pattern: /^[A-ZñÑa-z áéíóúÁÉÍÓÚüÜ]*$/
      msg: "Escriba un nombre (solo letras)."

    lastname:
      required: true
      pattern: /^[A-ZñÑa-z áéíóúÁÉÍÓÚüÜ]*$/
      msg: "Escriba un Apellido (solo letras)."

    second_lastname:
      required: false
      pattern: /^[A-ZñÑa-z áéíóúÁÉÍÓÚüÜ]*$/
      msg: "Solo letras."

    age:
      required: false
      range: [0, 150]
      msg: "Introdusca una edad valida."

    time_land:
      required: true
      msg: "Introdusca un número dias entre 0 y 365."
      range: [0, 365]
    
class Runpa.Collections.PeopleCollection extends Backbone.Collection
  model: Runpa.Models.Person
  #url: '/registers' 