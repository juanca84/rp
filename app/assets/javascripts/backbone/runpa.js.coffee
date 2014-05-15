#= require_self
#= require_tree ./templates
#= require_tree ./views
#= require_tree ./models

window.Runpa =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  
$(document).on "click", ".remove-static-field", ->
  $(this).siblings().eq(1).click()
  return

# $(document).on "keyup", "form.form-register input[type=text]", ->
#   @value = @value.toUpperCase()
#   return

$(document).on "keyup keypress", "form.form-register input", (e) ->
  code = e.keyCode or e.which
  if code is 13
    e.preventDefault()
    false
