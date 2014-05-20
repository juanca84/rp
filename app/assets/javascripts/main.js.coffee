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
