#= require_self
#= require_tree ./templates
#= require_tree ./views

window.Runpa =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
$ -> 
  $('.table_works tbody tr').eq(1).find('input.own_labor').attr('readonly', true)