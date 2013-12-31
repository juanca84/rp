Runpa.Views.Sons ||= {}

class Runpa.Views.Sons.NewView extends Backbone.View

  new_son_tmp: JST["backbone/templates/sons/new"]

  el: '#sons'

  initialize: ->
    _.bindAll this, "render", "add_son"
    @render()

  add_son: ->
    alert 'adicionar hijo/a'

  render: ->
    return this
