#desabilitar la tecla delete para ir atras
$(document).unbind("keydown").bind "keydown", (event) ->
  doPrevent = false
  if event.keyCode is 8
    d = event.srcElement or event.target
    if (d.tagName.toUpperCase() is "INPUT" and (d.type.toUpperCase() is "TEXT" or d.type.toUpperCase() is "PASSWORD" or d.type.toUpperCase() is "FILE" or d.type.toUpperCase() is "EMAIL")) or d.tagName.toUpperCase() is "TEXTAREA"
      doPrevent = d.readOnly or d.disabled
    else
      doPrevent = true
  event.preventDefault()  if doPrevent
  return

#desabilitar el enter para salvar sin terminar
$(document).on "keypress", "form", (e) ->
  code = e.keyCode or e.which
  if code is 13
    e.preventDefault()
    false

$(document).on "click", "#register_is_owner_false", ->
  $("#owner").removeClass("hide")
  $("#register_owner_attributes_person_attributes_name").focus()
  $("#register_owner_attributes_person_attributes_name").select()

$(document).on "click", "#register_is_owner_true", ->
  $("#owner").addClass("hide")
  $("#register_manager_type_id").focus()
  $("#register_manager_type_id").select()

#metodo para preguntar si un productor es individual
$(document).on "click", "#register_individual_producer_true", ->
  $("#partnerships").addClass("hide")
  $("#register_owner_attributes_person_attributes_name").focus()
  $("#register_owner_attributes_person_attributes_name").select()

$(document).on "click", "#register_individual_producer_false", ->
  $("#partnerships").removeClass("hide")
  $("#register_manager_type_id").focus()
  $("#register_manager_type_id").select()


jQuery ($) ->
	if $('#register_is_owner_false').is(':checked')
    $("#owner").removeClass("hide")

  if $('#register_individual_producer_false').is(':checked')
    $("#partnerships").removeClass("hide")
  
  $('#register_partnership_attributes_name').focus()
  $('#register_partnership_attributes_name').select()

  field = $('.department_lands').first()
  field.focus()
  field.select()

  if($('.first_field_son').size() > 0)

    field = $('.first_field_son').first()
    field.focus()
    field.select()
  else
    field = $('.first_field_aggregate').first()
    field.focus()
    field.select()

  field = $('.department_productions').first()
  field.focus()
  field.select()


#por default toma el primer campo para llenar
$(document).ready ->
  $("#register_is_owner_true").click()

#script que reemplaza la tecla enter por tab(para dezplazarse al siguiente campo)
$(document).on "keyup", "input, select", (e) ->
  
  # ENTER PRESSED
  if e.which is 13
    # FOCUS ELEMENT 
    
    inputs = $(this).parents("form").eq(0).find("input:visible, select")
    #console.log inputs
    idx = inputs.index(this)
    if idx is inputs.length - 1
      $(inputs[0]).select()
    else
      $(inputs[idx + 1]).focus() #  handles submit buttons
      $(inputs[idx + 1]).select()
    false

#metodo para formatear fechas en javascript
foobar: (date) ->
  alert foo.array
  return