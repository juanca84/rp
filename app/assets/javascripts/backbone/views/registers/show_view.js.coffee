Runpa.Views.Registers ||= {}

class Runpa.Views.Registers.ShowView extends Backbone.View
  template: JST["backbone/templates/registers/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
