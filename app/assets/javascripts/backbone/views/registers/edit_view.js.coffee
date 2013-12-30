Runpa.Views.Registers ||= {}

class Runpa.Views.Registers.EditView extends Backbone.View
  template : JST["backbone/templates/registers/edit"]

  events :
    "submit #edit-register" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (register) =>
        @model = register
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
