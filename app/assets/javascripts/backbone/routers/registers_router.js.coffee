class Runpa.Routers.RegistersRouter extends Backbone.Router
  initialize: (options) ->
    @registers = new Runpa.Collections.RegistersCollection()
    @registers.reset options.registers

  routes:
    "new"      : "newRegister"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newRegister: ->
    @view = new Runpa.Views.Registers.NewView(collection: @registers)
    $("#registers").html(@view.render().el)

  index: ->
    @view = new Runpa.Views.Registers.IndexView(registers: @registers)
    $("#registers").html(@view.render().el)

  show: (id) ->
    register = @registers.get(id)

    @view = new Runpa.Views.Registers.ShowView(model: register)
    $("#registers").html(@view.render().el)

  edit: (id) ->
    register = @registers.get(id)

    @view = new Runpa.Views.Registers.EditView(model: register)
    $("#registers").html(@view.render().el)
