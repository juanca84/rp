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
    "change .province_lands"      : "update_communities_by_province" 
    "change .community_lands"     : "update_another_communities"
  
    "click .remove-static-field" : "remove_static_field"

    #metodo para salvar
    "click #saveButton": (e) ->
      e.preventDefault()
      @saveUp()
      return

  initialize: ->
    @people = new Runpa.Collections.PeopleCollection()
    _.bindAll this, "render", "add_row"
    @render()

  add_row: (e)->
    type = $(e.currentTarget).attr('data-type')
    tr_id = @generate_id()
    model = new Backbone.Model
    if type == 'son'
      model = new Runpa.Models.Person({ time_land: 0 })
      @people.add([ model ])
    else if type == 'aggregate'
      model = new Runpa.Models.Person({ time_land: 0 })
      @people.add([ model ])

    view = new Runpa.Views.Rows.NewView({ model: model, id: type + "-" + tr_id, tr_id: tr_id, type: type })

    @$('table.table_' + type + 's tbody tr:last').after(view.render().el)
    $('.first_field_' + type).last().focus()
    $('.first_field_' + type).last().select()
    
    $('.department_lands').last().focus()
    $('.department_lands').last().select()

    # if type is 'land'
    #   #columna para trabajo
    #   type = 'work'
    #   view = new Runpa.Views.Rows.NewView({ id: type + "-" + tr_id, tr_id: tr_id, type: type })
    #   @$('table.table_' + type + 's tbody tr:last').after(view.render().el)

    #   #columna para capital
    #   type = 'capital'
    #   view = new Runpa.Views.Rows.NewView({ id: type + "-" + tr_id, tr_id: tr_id, type: type })
    #   @$('table.table_' + type + 's tbody tr:last').after(view.render().el)  


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
    console.log select_id
    department_id =  element.val()
   #actualizara las provincias
    $.ajax(
      url: '/registers/' + department_id + '/get_provinces'
      dataType: 'html'
    ).success (data) ->
      $('#' + select_id.replace('department', 'province')).html(data) 
      $('#' + select_id.replace('department_lands_', 'work-') + ' .department').val($('#' + select_id + ' option:selected').text())
      $('#' + select_id.replace('department_lands_', 'capital-') + ' .department').val($('#' + select_id + ' option:selected').text())
    #actualizara los municipios
    $.ajax(
      url: '/registers/' + department_id + '/get_communities'
      dataType: 'html'
    ).success (data) ->
      $('#' + select_id.replace('department', 'community')).html(data) 
      $('#' + select_id.replace('department_lands_', 'work-') + ' .department').val($('#' + select_id + ' option:selected').text())
      $('#' + select_id.replace('department_lands_', 'capital-') + ' .department').val($('#' + select_id + ' option:selected').text())
    false

  update_communities_by_province: (event) ->
    element =  $(event.currentTarget)
    select_id = element.attr('id')
    province_id =  element.val()
    $.ajax(
      url: '/registers/' + province_id + '/get_communities?province=true'
      dataType: 'html'
    ).success (data) ->
      $('#' + select_id.replace('province', 'community')).html(data) 

    false

  update_another_communities: (event) -> 
    element =  $(event.currentTarget)
    select_id = element.attr('id')
    $('#' + select_id.replace('community_lands_', 'work-') + ' .community').val($('#' + select_id + ' option:selected').text())
    $('#' + select_id.replace('community_lands_', 'capital-') + ' .community').val($('#' + select_id + ' option:selected').text())
    false

  #metodo para salvar el fomulario
  saveUp: ->
    # Check if the model is valid before saving
    # See: http://thedersen.com/projects/backbone-validation/#methods/isvalid
    if @people.isValid()
      $('form').submit()
    else
      alert "Se encontraron algunos errores, por favor revise el formulario."
      false

  render: ->
    return this