class Runpa.Models.Register extends Backbone.Model
  paramRoot: 'register'

  #defaults:
  validation: 
    name:
      required: true
      pattern: 'name',
      msg: 'Por favor, introducir el nombre.'

class Runpa.Collections.RegistersCollection extends Backbone.Collection
  model: Runpa.Models.Register
  #url: '/registers' 