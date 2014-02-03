Runpa.Views.Rows ||= {}

class Runpa.Views.Rows.NewView extends Backbone.View

  new_agricultural_production_tmp: JST["backbone/templates/rows/new_agricultural_production"]
  new_capital_tmp: JST["backbone/templates/rows/new_capital"]
  new_land_tmp: JST["backbone/templates/rows/new_land"]
  new_partnership_tmp: JST["backbone/templates/rows/new_partnership"]
  new_person_tmp: JST["backbone/templates/rows/new_person"]
  new_work_tmp: JST["backbone/templates/rows/new_work"]

  events:
    "click .remove" : "remove"

  tagName: "tr"

  initialize: ->
    @id = @options.id
    @type = @options.type
    _.bindAll this, "render"
    @render()

  remove_son: -> 
    this.remove() 

  render: ->
    if @type is "agricultural_production"
      $(@el).html(@new_agricultural_production_tmp({ id: @id }))

    else if @type is "aggregate"
      $(@el).html(@new_person_tmp({ id: @id, type: @type }))

    else if @type is "capital"
      $(@el).html(@new_capital_tmp({ id: @id }))

    else if @type is "land"
      $(@el).html(@new_land_tmp({ id: @id }))

    else if @type is "partnership"
      $(@el).html(@new_partnership_tmp({ id: @id }))

    else if @type is "son"
      $(@el).html(@new_person_tmp({ id: @id, type: @type }))

    else if @type is "work"
      $(@el).html(@new_work_tmp({ id: @id }))

    return this