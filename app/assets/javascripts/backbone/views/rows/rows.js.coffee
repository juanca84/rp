Runpa.Views.Rows ||= {}

class Runpa.Views.Rows.NewView extends Backbone.View

  new_capital_tmp: JST["backbone/templates/rows/new_capital"]
  new_land_tmp: JST["backbone/templates/rows/new_land"]
  new_partnership_tmp: JST["backbone/templates/rows/new_partnership"]
  new_person_tmp: JST["backbone/templates/rows/new_person"]
  new_production_tmp: JST["backbone/templates/rows/new_production"]
  new_work_tmp: JST["backbone/templates/rows/new_work"]

  events:
    "click .remove" : "remove"

  tagName: "tr"

  remove: -> 
    id_land = @el.id
    console.log id_land
    $("#" + id_land.replace("land", "work")).remove()
    $("#" + id_land.replace("land", "capital")).remove()
    @el.remove()

  initialize: (options)->
    @options = options
    @id = @options.tr_id  
    @type = @options.type
    _.bindAll this, "render"
    @render()

  render: ->

    if @type is "aggregate"
      $(@el).html(@new_person_tmp({ id: @id, type: @type }))

    else if @type is "land"
      $(@el).html(@new_land_tmp({ id: @id }))

    else if @type is "partnership"
      $(@el).html(@new_partnership_tmp({ id: @id }))

    else if @type is "son"
      $(@el).html(@new_person_tmp({ id: @id, type: @type }))

    else if @type is "work"
      $(@el).html(@new_work_tmp({ id: @id }))

    else if @type.indexOf("capital") != -1 
      parent_id = @type.replace('land-','').replace('-capital','')
      $(@el).html(@new_capital_tmp({ id: @id, parent_id: parent_id}))

    else if @type.indexOf("production") != -1
      parent_id = @type.replace('land-','').replace('-production','')
      $(@el).html(@new_production_tmp({ id: @id, parent_id: parent_id }))

    return this