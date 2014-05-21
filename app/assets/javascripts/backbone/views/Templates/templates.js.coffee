Runpa.Views.Templates ||= {}

class Runpa.Views.Templates.NewView extends Backbone.View
  el: 'form'

  initialize: ->
    _.bindAll this, "render"
    #@render()

  render: ->
    department =  @model.get('department')
    province = @model.get('province')
    community= @model.get('community')

    console.log department, province, community
    - if department
      dom_element = $('.department')
      dom_element.val(department)
      # dom_element.change()

    - if province
      dom_element = $('.province')
      dom_element.val(province)
      # dom_element.change()  

    - if community
      dom_element = $('.community')
      dom_element.val(community)
      # dom_element.change()  

    return this
