Runpa.Views.Registers ||= {}

class Runpa.Views.Registers.RegisterView extends Backbone.View
  template: JST["backbone/templates/registers/register"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
