#= require_self
#= require_tree ./templates
#= require_tree ./views

window.Runpa =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  
$(document).on "click", ".remove-static-field", ->
  $(this).siblings().eq(1).click()
  return 