(function() {
  var RegisterForm, RegisterModel;

  Backbone.Validation.configure({
    forceUpdate: true
  });

  _.extend(Backbone.Validation.callbacks, {
    valid: function(view, attr, selector) {
      var $el, $group;
      $el = view.$("[name=" + attr + "]");
      $group = $el.closest(".form-group");
      $group.removeClass("has-error");
      $group.find(".help-block").html("").addClass("hidden");
    },
    invalid: function(view, attr, error, selector) {
      var $el, $group;
      $el = view.$("[name=" + attr + "]");
      $group = $el.closest(".form-group");
      $group.addClass("has-error");
      $group.find(".help-block").html(error).removeClass("hidden");
    }
  });

  RegisterModel = Backbone.Model.extend({
    defaults: {
      country: "Norway"
    },
    validation: {
      name: {
        required: true,
        msg: "Escriba un nombre."
      },
      username: {
        required: true
      },
      email: {
        required: true,
        pattern: "email"
      },
      password: {
        minLength: 8
      },
      repeatPassword: {
        equalTo: "password",
        msg: "The passwords does not match"
      },
      country: {
        oneOf: ["Norway", "Sweeden"]
      },
      gender: {
        required: true
      },
      age: {
        required: false,
        range: [18, 100]
      },
      terms: {
        acceptance: true
      }
    }
  });

  RegisterForm = Backbone.View.extend({
    events: {
      "click #saveButton": function(e) {
        e.preventDefault();
        this.saveUp();
      }
    },
    bindings: {
      "[name=name]": {
        observe: "name",
        setOptions: {
          validate: true
        }
      },
      "[name=username]": {
        observe: "username",
        setOptions: {
          validate: true
        }
      },
      "[name=email]": {
        observe: "email",
        setOptions: {
          validate: true
        }
      },
      "[name=password]": {
        observe: "password",
        setOptions: {
          validate: true
        }
      },
      "[name=repeatPassword]": {
        observe: "repeatPassword",
        setOptions: {
          validate: true
        }
      },
      "[name=country]": {
        observe: "country",
        selectOptions: {
          collection: function() {
            return ["Norway", "Sweeden", "Denmark", "Finland", "Iceland"];
          }
        },
        setOptions: {
          validate: true
        }
      },
      "[name=gender]": {
        observe: "gender",
        setOptions: {
          validate: true
        }
      },
      "[name=age]": {
        observe: "age",
        events: ["change"],
        onSet: function(val) {
          return parseInt(val, 10) || undefined;
        },
        setOptions: {
          validate: true
        }
      },
      "[name=terms]": {
        observe: "terms",
        setOptions: {
          validate: true
        }
      }
    },
    initialize: function() {
      Backbone.Validation.bind(this);
    },
    render: function() {
      this.stickit();
      return this;
    },
    saveUp: function() {
      if (this.model.isValid(true)) {
        alert("Great Success!");
      }
    },
    remove: function() {
      Backbone.Validation.unbind(this);
      return Backbone.View.prototype.remove.apply(this, arguments_);
    }
  });

  $(function() {
    var view;
    view = new RegisterForm({
      el: "form.form-register",
      model: new RegisterModel()
    });
    view.render();
  });

}).call(this);
