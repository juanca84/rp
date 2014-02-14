Runpa.Views.Works ||= {}

class Runpa.Views.Works.NewView extends Backbone.View

  el: 'table.table_works'

  events:
    "keyup  td input" : "update_summations"


  initialize: ->
    @total = $('#total_time_to_land').val()
    @total2 = @options.total
    _.bindAll this, "render"
    @render()

  update_summations: (event) ->
    tr_id = $($(event.currentTarget).parent().parent()).attr('id')

    $('#' + tr_id).find('input.own_labor')

    own_labor       = $('#' + tr_id).find('input.own_labor')
    eventual_labor  = $('#' + tr_id).find('input.eventual_labor')
    permanent_labor = $('#' + tr_id).find('input.permanent_labor')

    men_per_year_own        = $('#' + tr_id).find('input.men_per_year_own')
    men_per_year_eventually = $('#' + tr_id).find('input.men_per_year_eventually')
    men_per_year_total      = $('#' + tr_id).find('input.men_per_year_total')

    men_per_year_own.val( @integer_val( own_labor.val() )/250 )
    men_per_year_eventually.val( @integer_val( eventual_labor.val() )/250 )    

    men_per_year_total.val( parseFloat( men_per_year_own.val() ) + parseFloat( men_per_year_eventually.val() ) + @integer_val( permanent_labor.val() ) )

  integer_val: (value) -> 
    if Math.floor(value).toString() == value.toString() && $.isNumeric(value)
      parseInt(value)
    else 
      0

  render: ->
    #alert 'this'
    return this