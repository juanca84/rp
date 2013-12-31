Runpa.Views.Registers ||= {}

class Runpa.Views.Registers.NewView extends Backbone.View

  el: '.container.main'

  events:
    "click .add_son" : "add_son"

  initialize: ->
    _.bindAll this, "render", "add_son"
    @render()

  add_son: ->
    alert 'adicionar hijo/a'

  render: ->
    return this
