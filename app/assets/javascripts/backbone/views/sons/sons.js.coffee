Runpa.Views.Sons ||= {}

class Runpa.Views.Sons.NewView extends Backbone.View

  new_son_tmp: JST["backbone/templates/sons/new"]

  tagName: "tr"

  initialize: ->
    @id = @options.id
    _.bindAll this, "render"
    @render()

  render: ->
    $(@el).html(@new_son_tmp({ id: @id }))
    return this
