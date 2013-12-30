Runpa.Views.Registers ||= {}

class Runpa.Views.Registers.NewView extends Backbone.View
  template: JST["backbone/templates/registers/new"]

  events:
    "submit #new-register": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (register) =>
        @model = register
        window.location.hash = "/#{@model.id}"

      error: (register, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
