Runpa.Views.Registers ||= {}

class Runpa.Views.Registers.NewView extends Backbone.View

  el: '.container.main'

  events:
    "click .add_son"         : "add_row"
    "click .add_aggregate"   : "add_row"
    "click .add_partnership" : "add_row"
    "click .add_land"        : "add_row"
    "change #department_holder" : "update_communities"
    "change #department_register" : "update_communities"
    "change .department_lands" : "update_communities"
    "change .community_lands" : "update_another_communities"
    "click .static.remove-sons" : "remove_static_son_aggregate"
    "click .static.remove-aggregates" : "remove_static_son_aggregate"

  initialize: ->
    _.bindAll this, "render", "add_row"
    @render()

  add_row: (e)->
    type = $(e.currentTarget).attr('data-type')
    tr_id = @generate_id()
    view = new Runpa.Views.Rows.NewView({ id: type + "-" + tr_id, tr_id: tr_id, type: type })
    @$('table.table_' + type + 's tr:last').after(view.render().el)

    if type is 'land'
      #columna para trabajo
      type = 'work'
      view = new Runpa.Views.Rows.NewView({ id: type + "-" + tr_id, tr_id: tr_id, type: type })
      @$('table.table_' + type + 's tr:last').after(view.render().el)

      #columna para capital
      type = 'capital'
      view = new Runpa.Views.Rows.NewView({ id: type + "-" + tr_id, tr_id: tr_id, type: type })
      @$('table.table_' + type + 's tr:last').after(view.render().el)  
        
    false

  remove_static_son_aggregate: (event) ->
    son_cell = $(event.currentTarget).parent().parent()
    son_cell.remove()
    
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