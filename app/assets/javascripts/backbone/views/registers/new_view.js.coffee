Runpa.Views.Registers ||= {}

class Runpa.Views.Registers.NewView extends Backbone.View

  el: '#sons'

  initialize: ->
     _.bindAll this, "render"
     @render()

  render: ->
    return this
