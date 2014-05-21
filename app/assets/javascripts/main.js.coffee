$(document).on "click", "#register_is_owner_false", ->
  $("#owner").removeClass("hide")
  $("#register_owner_attributes_person_attributes_name").focus()
  $("#register_owner_attributes_person_attributes_name").select()

$(document).on "click", "#register_is_owner_true", ->
  $("#owner").addClass("hide")
  $("#register_manager_type_id").focus()
  $("#register_manager_type_id").select()

jQuery ($) ->
	if $('#register_is_owner_false').is(':checked')
    $("#owner").removeClass("hide")
  
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
$(document).on "keypress", "input, select", (e) ->
  
  # ENTER PRESSED
  if e.keyCode is 13
    # FOCUS ELEMENT 
    inputs = $(this).parents("form").eq(0).find("input:visible, select")

    console.log inputs
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