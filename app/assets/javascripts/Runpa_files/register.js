(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Runpa.Models.Register = (function(_super) {
    __extends(Register, _super);

    function Register() {
      return Register.__super__.constructor.apply(this, arguments);
    }

    Register.prototype.paramRoot = 'register';

    Register.prototype.validation = {
      name: {
        required: true,
        pattern: 'name',
        msg: 'Por favor, introducir el nombre.'
      }
    };

    return Register;

  })(Backbone.Model);

  Runpa.Collections.RegistersCollection = (function(_super) {
    __extends(RegistersCollection, _super);

    function RegistersCollection() {
      return RegistersCollection.__super__.constructor.apply(this, arguments);
    }

    RegistersCollection.prototype.model = Runpa.Models.Register;

    return RegistersCollection;

  })(Backbone.Collection);

}).call(this);
