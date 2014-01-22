Runpa.Views.Sons ||= {}

class Runpa.Views.Sons.NewView extends Backbone.View

  new_son_tmp: JST["backbone/templates/sons/new"]

  events:
    "click .remove-sons" : "remove_son"

  tagName: "tr"


  initialize: ->
    @id = @options.id
    _.bindAll this, "render"
    @render()

  remove_son: -> 
  	this.remove() 

  render: ->
    $(@el).html(@new_son_tmp({ id: @id }))
    return this
