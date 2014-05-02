$(document).on "click", "#register_is_owner_false", ->
  $("#owner").removeClass("hide")

$(document).on "click", "#register_is_owner_true", ->
	$("#owner").addClass("hide")

jQuery ($) ->
	if $('#register_is_owner_false').is(':checked')
		$("#owner").removeClass("hide")