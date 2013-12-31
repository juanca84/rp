Runpa.Views.Registers ||= {}

class Runpa.Views.Registers.NewView extends Backbone.View

  el: '.container.main'

  events:
    "click .add_son" : "add_son"
    "click .add_aggregate" : "add_aggregate"

  initialize: ->
    _.bindAll this, "render", "add_son"
    @render()

  add_son: ->
    view = new  Runpa.Views.Sons.NewView({ id: @generate_id() })
    @$('table.table_sons tr:last').after(view.render().el)

  add_aggregate: ->
    view = new  Runpa.Views.Aggregates.NewView({ id: @generate_id() })
    @$('table.table_aggregates tr:last').after(view.render().el)

  generate_id: ->
    new Date().getTime()

  render: ->
    return this
