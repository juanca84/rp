(function() {
  if (window.JST == null) {
    window.JST = {};
  }

  window.JST['backbone/templates/rows/new_work'] = function(context) {
    return (function() {
      var $c, $e, $o;
      $e = window.HAML.escape;
      $c = window.HAML.cleanValue;
      $o = [];
      $o.push("<td>\n  <div class='col-sm-12'>\n    <input class='department form-control optional string' type='text' readonly>\n  </div>\n</td>\n<td>\n  <div class='col-sm-12'>\n    <input class='community form-control optional string' type='text' readonly>\n  </div>\n</td>\n<td>\n  <input class='form-control integer numeric optional own_labor' id='register_works_attributes_" + this.id + "_own_labor' name='register[lands_attributes][" + ($e($c(this.id))) + "][own_labor]' type='text' value='" + ($e($c(0))) + "'>\n</td>\n<td>\n  <input class='eventual_labor form-control integer numeric optional' id='register_works_attributes_" + this.id + "_eventual_labor' name='register[lands_attributes][" + ($e($c(this.id))) + "][eventual_labor]' type='text' value='" + ($e($c(0))) + "'>\n</td>\n<td>\n  <input class='form-control integer numeric optional permanent_labor' id='register_works_attributes_" + this.id + "_permanent_labor' name='register[lands_attributes][" + ($e($c(this.id))) + "][permanent_labor]' type='text' value='" + ($e($c(0))) + "'>\n</td>\n<td>\n  <input class='float form-control men_per_year_own numeric optional' id='register_works_attributes_" + this.id + "_men_per_year_own' name='register[lands_attributes][" + ($e($c(this.id))) + "][men_per_year_own]' type='text' readonly value='" + ($e($c(0))) + "'>\n</td>\n<td>\n  <input class='float form-control men_per_year_eventually numeric optional' id='register_works_attributes_" + this.id + "_men_per_year_eventually' name='register[lands_attributes][" + ($e($c(this.id))) + "][men_per_year_eventually]' type='text' readonly value='" + ($e($c(0))) + "'>\n</td>\n<td>\n  <input class='float form-control men_per_year_total numeric optional' id='register_works_attributes_" + this.id + "_men_per_year_total' name='register[lands_attributes][" + ($e($c(this.id))) + "][men_per_year_total]' type='text' readonly value='" + ($e($c(0))) + "'>\n</td>\n<td>\n  <a class='btn btn-danger btn-small hide remove'>\n    <div class='glyphicon glyphicon-remove'></div>\n  </a>\n</td>");
      return $o.join("\n").replace(/\s([\w-]+)='true'/mg, ' $1').replace(/\s([\w-]+)='false'/mg, '').replace(/\s(?:id|class)=(['"])(\1)/mg, "");
    }).call(window.HAML.context(context));
  };

}).call(this);
