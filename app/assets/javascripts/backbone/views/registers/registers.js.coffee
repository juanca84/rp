Runpa.Views.Registers ||= {}

class Runpa.Views.Registers.NewView extends Backbone.View

  el: '.container.main'

  events:
    "click .add_son"         : "add_row"
    "click .add_aggregate"   : "add_row"
    "click .add_partnership" : "add_row"
    "click .add_land"        : "add_row"
    "click .add_capital"     : "add_row"
    "click .add_production"  : "add_row"

    "change #department_holder"   : "update_communities"
    "change #department_register" : "update_communities"
    "change .department_lands"    : "update_communities" 
    "change .community_lands"     : "update_another_communities"

    #"keyup .table_works tbody tr:nth-child(2) input.eventual_labor" : 'update_eventual_and_permanet_labor' 
    #"keyup .table_works tbody tr:nth-child(2) input.permanent_labor" : 'update_eventual_and_permanet_labor' 
    
    "click .remove-static-field" : "remove_static_field"

  initialize: ->
    _.bindAll this, "render", "add_row"
    @render()


  add_row: (e)->
    type = $(e.currentTarget).attr('data-type')
    tr_id = @generate_id()
    view = new Runpa.Views.Rows.NewView({ id: type + "-" + tr_id, tr_id: tr_id, type: type })
    @$('table.table_' + type + 's tbody tr:last').after(view.render().el)

    if type is 'land'
      #columna para trabajo
      type = 'work'
      view = new Runpa.Views.Rows.NewView({ id: type + "-" + tr_id, tr_id: tr_id, type: type })
      @$('table.table_' + type + 's tbody tr:last').after(view.render().el)

      #columna para capital
      type = 'capital'
      view = new Runpa.Views.Rows.NewView({ id: type + "-" + tr_id, tr_id: tr_id, type: type })
      @$('table.table_' + type + 's tbody tr:last').after(view.render().el)  
    
    false

  remove_static_field: (event) -> 
    row = $(event.currentTarget).parent().parent()
    row.addClass('hide')
    id  = $(row).attr('id') 
    if id.indexOf('land') != -1
      $('#' + id.replace('land','work')).remove()
    
  generate_id: ->
    new Date().getTime()

  update_communities: (event) ->
    element =  $(event.currentTarget)
    select_id = element.attr('id')
    department_id =  element.val()
    $.ajax(
      url: '/registers/' + department_id + '/get_communities'
      dataType: 'html'
    ).success (data) ->
      $('#' + select_id.replace('department', 'community')).html(data) 
      $('#' + select_id.replace('department_lands_', 'work-') + ' .department').val($('#' + select_id + ' option:selected').text())
      $('#' + select_id.replace('department_lands_', 'capital-') + ' .department').val($('#' + select_id + ' option:selected').text())
    false

  update_another_communities: (event) -> 
    element =  $(event.currentTarget)
    select_id = element.attr('id')
    $('#' + select_id.replace('community_lands_', 'work-') + ' .community').val($('#' + select_id + ' option:selected').text())
    $('#' + select_id.replace('community_lands_', 'capital-') + ' .community').val($('#' + select_id + ' option:selected').text())
    false

  render: ->
    return this