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

    "keyup .table_works tbody tr:nth-child(2) input.eventual_labor" : 'update_eventual_and_permanet_labor' 
    "keyup .table_works tbody tr:nth-child(2) input.permanent_labor" : 'update_eventual_and_permanet_labor' 
    
    "click .remove-static-field" : "remove_static_field"

  initialize: ->
    _.bindAll this, "render", "add_row", 'update_summation'
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

      @update_summation()

      #columna para capital
      type = 'capital'
      view = new Runpa.Views.Rows.NewView({ id: type + "-" + tr_id, tr_id: tr_id, type: type })
      @$('table.table_' + type + 's tbody tr:last').after(view.render().el)  
        
    false

  remove_static_field: (event) -> 
    son_cell = $(event.currentTarget).parent().parent()
    son_cell.addClass('hide')
    
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

  update_summation: () -> 
    #esto solo funciona para el primer registro de tierra
    own_labor = $('.table_works tbody tr').eq(1).find('input.own_labor')
    eventual_labor = $('.table_works tbody tr').eq(1).find('input.eventual_labor')
    permanent_labor = $('.table_works tbody tr').eq(1).find('input.permanent_labor')

    men_per_year_own = $('.table_works tbody tr').eq(1).find('input.men_per_year_own')
    men_per_year_eventually = $('.table_works tbody tr').eq(1).find('input.men_per_year_eventually')
    men_per_year_total = $('.table_works tbody tr').eq(1).find('input.men_per_year_total')
    
    total_time_to_land = $('#total_time_to_land').val()

    if total_time_to_land
      own_labor.val(total_time_to_land)

      if own_labor.val()
        men_per_year_own.val(own_labor.val()/250)
      else
        men_per_year_own.val(0)

      if eventual_labor.val()
        men_per_year_eventually.val(eventual_labor.val()/250)
      else
        men_per_year_eventually.val(0)    
      
      if permanent_labor.val()
        permanent_labor_val = permanent_labor.val()
      else
        permanent_labor_val =  0

      men_per_year_total.val(parseFloat(men_per_year_own.val()) + parseFloat(men_per_year_eventually.val()) + parseFloat(permanent_labor_val))

  update_eventual_and_permanet_labor: (event) ->
    labor = $(event.currentTarget).val()
    if Math.floor(labor).toString() == labor.toString() && $.isNumeric(labor)
      @update_summation()

  render: ->
    return this