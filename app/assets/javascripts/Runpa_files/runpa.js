(function() {
  window.Runpa = {
    Models: {},
    Collections: {},
    Routers: {},
    Views: {}
  };

  $(document).on("click", ".remove-static-field", function() {
    $(this).siblings().eq(1).click();
  });

  $(document).on("keyup keypress", "form.form-register input", function(e) {
    var code;
    code = e.keyCode || e.which;
    if (code === 13) {
      e.preventDefault();
      return false;
    }
  });
  $(document).on("click", "[type=number]", function(e){alert("en foco")});

}).call(this);
