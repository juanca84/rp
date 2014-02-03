Runpa.Views.Registers ||= {}

class Runpa.Views.Registers.NewView extends Backbone.View

  el: '.container.main'

  events:
    "click .add_son"         : "add_row"
    "click .add_aggregate"   : "add_row"
    "click .add_partnership" : "add_row"
    "click .add_land"        : "add_row"
    "click .add_work"        : "add_row"
    "click .add_capital"     : "add_row"
    "click .add_production"  : "add_row"
    "click .static.remove-sons" : "remove_static_son_aggregate"
    "click .static.remove-aggregates" : "remove_static_son_aggregate"

  initialize: ->
    _.bindAll this, "render", "add_row"
    @render()

  add_row: (e)->
    type = $(e.currentTarget).attr('data-type')
    view = new Runpa.Views.Rows.NewView({ id: @generate_id(), type: type })
    @$('table.table_' + type + 's tr:last').after(view.render().el)
    false

  remove_static_son_aggregate: (event) ->
    son_cell = $(event.currentTarget).parent().parent()
    son_cell.remove()
    
  generate_id: ->
    new Date().getTime()

  render: ->
    return this