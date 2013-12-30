class Runpa.Models.Register extends Backbone.Model
  paramRoot: 'register'

  defaults:
    code: null

class Runpa.Collections.RegistersCollection extends Backbone.Collection
  model: Runpa.Models.Register
  url: '/registers'
