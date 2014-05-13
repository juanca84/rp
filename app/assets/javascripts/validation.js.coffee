# Since we are automatically updating the model, we want the model
# to also hold invalid values, otherwise, we might be validating
# something else than the user has entered in the form.
# See: http://thedersen.com/projects/backbone-validation/#configuration/force-update
Backbone.Validation.configure forceUpdate: true

# Extend the callbacks to work with Bootstrap, as used in this example
# See: http://thedersen.com/projects/backbone-validation/#configuration/callbacks
_.extend Backbone.Validation.callbacks,
  valid: (view, attr, selector) ->
    $el = view.$("[name=" + attr + "]")
    $group = $el.closest(".form-group")
    $group.removeClass "has-error"
    $group.find(".help-block").html("").addClass "hidden"
    return

  invalid: (view, attr, error, selector) ->
    $el = view.$("[name=" + attr + "]")
    $group = $el.closest(".form-group")
    $group.addClass "has-error"
    $group.find(".help-block").html(error).removeClass "hidden"
    return


# Define a model with some validation rules
SignUpModel = Backbone.Model.extend(
  defaults:
    country: "Norway"

  validation:
    username:
      required: true

    email:
      required: true
      pattern: "email"

    password:
      minLength: 8

    repeatPassword:
      equalTo: "password"
      msg: "The passwords does not match"

    country:
      oneOf: [
        "Norway"
        "Sweeden"
      ]

    gender:
      required: true

    age:
      required: false
      range: [
        18
        100
      ]

    terms:
      acceptance: true
)
SignUpForm = Backbone.View.extend(
  events:
    "click #signUpButton": (e) ->
      e.preventDefault()
      @signUp()
      return

  
  # Use stickit to perform binding between
  # the model and the view
  # See: https://github.com/NYTimes/backbone.stickit
  bindings:
    "[name=username]":
      observe: "username"
      setOptions:
        validate: true

    "[name=email]":
      observe: "email"
      setOptions:
        validate: true

    "[name=password]":
      observe: "password"
      setOptions:
        validate: true

    "[name=repeatPassword]":
      observe: "repeatPassword"
      setOptions:
        validate: true

    "[name=country]":
      observe: "country"
      selectOptions:
        collection: ->
          [
            "Norway"
            "Sweeden"
            "Denmark"
            "Finland"
            "Iceland"
          ]

      setOptions:
        validate: true

    "[name=gender]":
      observe: "gender"
      setOptions:
        validate: true

    "[name=age]":
      observe: "age"
      events: ["change"]
      onSet: (val) ->
        parseInt(val, 10) or `undefined`

      setOptions:
        validate: true

    "[name=terms]":
      observe: "terms"
      setOptions:
        validate: true

  initialize: ->
    
    # This hooks up the validation
    # See: http://thedersen.com/projects/backbone-validation/#using-form-model-validation/validation-binding
    Backbone.Validation.bind this
    return

  render: ->
    @stickit()
    this

  signUp: ->
    
    # Check if the model is valid before saving
    # See: http://thedersen.com/projects/backbone-validation/#methods/isvalid
    
    # this.model.save();
    alert "Great Success!"  if @model.isValid(true)
    return

  remove: ->
    
    # Remove the validation binding
    # See: http://thedersen.com/projects/backbone-validation/#using-form-model-validation/unbinding
    Backbone.Validation.unbind this
    Backbone.View::remove.apply this, arguments_
)
$ ->
  view = new SignUpForm(
    el: "form"
    model: new SignUpModel()
  )
  view.render()
  return
