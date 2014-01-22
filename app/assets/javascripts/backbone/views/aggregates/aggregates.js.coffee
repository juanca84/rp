Runpa.Views.Aggregates ||= {}

class Runpa.Views.Aggregates.NewView extends Backbone.View

  new_son_tmp: JST["backbone/templates/aggregates/new"]

  events:
    "click .remove-aggregates" : "remove_aggregate"

  tagName: "tr"

  initialize: ->
    @id = @options.id
    _.bindAll this, "render"
    @render()

  remove_aggregate: -> 
  	this.remove()

  render: ->
    $(@el).html(@new_son_tmp({ id: @id }))
    return this
