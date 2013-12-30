Runpa.Views.Registers ||= {}

class Runpa.Views.Registers.IndexView extends Backbone.View
  template: JST["backbone/templates/registers/index"]

  initialize: () ->
    @options.registers.bind('reset', @addAll)

  addAll: () =>
    @options.registers.each(@addOne)

  addOne: (register) =>
    view = new Runpa.Views.Registers.RegisterView({model : register})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(registers: @options.registers.toJSON() ))
    @addAll()

    return this
