(function() {
  $(document).on("click", "#register_is_owner_false", function() {
    return $("#owner").removeClass("hide");
  });

  $(document).on("click", "#register_is_owner_true", function() {
    return $("#owner").addClass("hide");
  });

  jQuery(function($) {
    if ($('#register_is_owner_false').is(':checked')) {
      return $("#owner").removeClass("hide");
    }
  });

}).call(this);
