Runpa.Views.Holders ||= {}

class Runpa.Views.Holders.NewHolder extends Backbone.View
  events:
    "click #saveButton": (e) ->
      e.preventDefault()
      @saveUp()
      return

  # Use stickit to perform binding between
  # the model and the view
  # See: https://github.com/NYTimes/backbone.stickit
  bindings:
    "[field=manager_type]":
      observe: "manager_type"
      setOptions:
        validate: true

    "[field=holder_1_name]":
      observe: "holder_1_name"
      setOptions:
        validate: true

    "[field=holder_1_lastname]":
      observe: "holder_1_lastname"
      setOptions:
        validate: true

    "[field=holder_1_second_lastname]":
      observe: "holder_1_second_lastname"
      setOptions:
        validate: true

    "[field=holder_cellphone]":
      observe: "holder_cellphone"
      setOptions:
        validate: true

    "[field=holder_1_birthdate]":
      observe: "holder_1_birthdate"
      setOptions:
        validate: true

    "[field=holder_1_time_land]":
      observe: "holder_1_time_land"
      setOptions:
        validate: true

    "[field=holder_2_name]":
      observe: "holder_2_name"
      setOptions:
        validate: true

    "[field=holder_2_lastname]":
      observe: "holder_2_lastname"
      setOptions:
        validate: true

    "[field=holder_2_second_lastname]":
      observe: "holder_2_second_lastname"
      setOptions:
        validate: true        

    "[field=holder_2_birthdate]":
      observe: "holder_2_birthdate"
      setOptions:
        validate: true

    "[field=holder_2_time_land]":
      observe: "holder_2_time_land"
      setOptions:
        validate: true
        
  initialize: ->
    
    # This hooks up the validation
    # See: http://thedersen.com/projects/backbone-validation/#using-form-model-validation/validation-binding
    
    Backbone.Validation.configure forceUpdate: true

    # Extend the callbacks to work with Bootstrap, as used in this example
    # See: http://thedersen.com/projects/backbone-validation/#configuration/callbacks
    _.extend Backbone.Validation.callbacks,
      valid: (view, attr, selector) ->
        $el = view.$("[field=" + attr + "]")
        $group = $el.closest(".field")
        $group.removeClass "has-error"
        $group.find(".help-block").html("").addClass "hidden"
        return

      invalid: (view, attr, error, selector) ->     
        $el = view.$("[field=" + attr + "]")
        $group = $el.closest(".field")
        $group.addClass "has-error"
        $group.find(".help-block").html(error).removeClass "hidden"
        return


    Backbone.Validation.bind this
    #@remove_zeros()
    return

  render: ->
    @stickit()
    this

  saveUp: ->   
    # Check if the model is valid before saving
    # See: http://thedersen.com/projects/backbone-validation/#methods/isvalid
    if @model.isValid(true)
      $('form').submit()
    else
      alert "Se encontraron algunos errores, por favor revise el formulario."
      false

  remove: ->
    
    # Remove the validation binding
    # See: http://thedersen.com/projects/backbone-validation/#using-form-model-validation/unbinding
    Backbone.Validation.unbind this
    Backbone.View::remove.apply this, arguments_