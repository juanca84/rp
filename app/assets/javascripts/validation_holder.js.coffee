# Since we are automatically updating the model, we want the model
# to also hold invalid values, otherwise, we might be validating
# something else than the user has entered in the form.
# See: http://thedersen.com/projects/backbone-validation/#configuration/force-update
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

# Define a model with some validation rules
class Runpa.Models.Holder extends Backbone.Model
  validation:
    manager_type:
      required: true 
      msg: "Eliga una de las opciones."

    holder_name:
      required: true
      msg: "Escriba un nombre."

    holder_lastname:
      required: true
      msg: "Escriba un Apellido."

    holder_1_time_land:
      required: true
      msg: "Introdusca un número entre 0 y 365."
      range: [0, 365]

    holder_2_time_land:
      required: true
      msg: "Introdusca un número entre 0 y 365."
      range: [0, 365]

class Runpa.Views.Registers.NewHolder extends Backbone.View
  events:
    "click #saveButton": (e) ->
      e.preventDefault()
      @saveUp()
      return

    "focus .numeric": (e, t) -> 
      console.log @, this

  # Use stickit to perform binding between
  # the model and the view
  # See: https://github.com/NYTimes/backbone.stickit
  bindings:
    "[field=manager_type]":
      observe: "manager_type"
      setOptions:
        validate: true

    "[field=holder_name]":
      observe: "holder_name"
      setOptions:
        validate: true

    "[field=holder_lastname]":
      observe: "holder_lastname"
      setOptions:
        validate: true

    "[field=holder_1_time_land]":
      observe: "holder_1_time_land"
      setOptions:
        validate: true

    "[field=holder_2_time_land]":
      observe: "holder_2_time_land"
      setOptions:
        validate: true
        
  initialize: ->
    
    # This hooks up the validation
    # See: http://thedersen.com/projects/backbone-validation/#using-form-model-validation/validation-binding
    
    Backbone.Validation.bind this
    #@remove_zeros()
    return

  render: ->
    @stickit()
    this

  saveUp: ->
    
    # Check if the model is valid before saving
    # See: http://thedersen.com/projects/backbone-validation/#methods/isvalid
    
    # this.model.save();
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

  remove_zeros: -> 
    console.log "onfocus"
    $(document).on "focus", ".numeric", (e) ->
      console.log @
      if Number($(@).val()) == 0 
        $(@).val("")

  #console.log "onfocus", $(@).val()