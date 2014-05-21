class Runpa.Models.Holder extends Backbone.Model
  validation:
    manager_type:
      required: true 
      msg: "Eliga una de las opciones."

    holder_1_name:
      required: true
      pattern: /^[A-ZñÑa-z áéíóúÁÉÍÓÚüÜ]*$/
      msg: "Escriba un nombre (solo letras)."

    holder_1_lastname:
      required: true
      pattern: /^[A-ZñÑa-z áéíóúÁÉÍÓÚüÜ]*$/
      msg: "Escriba un Apellido (solo letras)."

    holder_1_second_lastname:
      required: false
      pattern: /^[A-ZñÑa-z áéíóúÁÉÍÓÚüÜ]*$/
      msg: "Solo letras."

    holder_cellphone:
      required: false
      pattern: /^\d*$/
      msg: "Escriba un número valido."

    holder_1_birthdate:
      required: false
      pattern: /^(?:(?:0?[1-9]|1\d|2[0-8])(\/|-)(?:0?[1-9]|1[0-2]))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^(?:(?:31(\/|-)(?:0?[13578]|1[02]))|(?:(?:29|30)(\/|-)(?:0?[1,3-9]|1[0-2])))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^(29(\/|-)0?2)(\/|-)(?:(?:0[48]00|[13579][26]00|[2468][048]00)|(?:\d\d)?(?:0[48]|[2468][048]|[13579][26]))$/
      msg: "Escriba una fecha valida (dd/mm/aaaa)." 

    holder_1_time_land:
      required: true
      msg: "Introdusca un número entre 0 y 365."
      range: [0, 365]

    holder_2_name:
      required: false
      pattern: /^[A-ZñÑa-z áéíóúÁÉÍÓÚüÜ]*$/
      msg: "Escriba un nombre (solo letras)."

    holder_2_lastname:
      required: false
      pattern: /^[A-ZñÑa-z áéíóúÁÉÍÓÚüÜ]*$/
      msg: "Escriba un Apellido (solo letras)."

    holder_2_second_lastname:
      required: false
      pattern: /^[A-ZñÑa-z áéíóúÁÉÍÓÚüÜ]*$/
      msg: "Solo letras."

    holder_2_birthdate:
      required: false
      pattern: /^(?:(?:0?[1-9]|1\d|2[0-8])(\/|-)(?:0?[1-9]|1[0-2]))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^(?:(?:31(\/|-)(?:0?[13578]|1[02]))|(?:(?:29|30)(\/|-)(?:0?[1,3-9]|1[0-2])))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^(29(\/|-)0?2)(\/|-)(?:(?:0[48]00|[13579][26]00|[2468][048]00)|(?:\d\d)?(?:0[48]|[2468][048]|[13579][26]))$/
      msg: "Escriba una fecha valida (dd/mm/aaaa)." 

    holder_2_time_land:
      required: true
      msg: "Introdusca un número entre 0 y 365."
      range: [0, 365]