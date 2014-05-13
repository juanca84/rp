(function() {
  if (window.JST == null) {
    window.JST = {};
  }

  window.JST['backbone/templates/rows/new_partnership'] = function(context) {
    return (function() {
      var $c, $e, $o;
      $e = window.HAML.escape;
      $c = window.HAML.cleanValue;
      $o = [];
      $o.push("<td class='col-sm-9'>\n  <input class='form-control optional string' id='register_partnerships_attributes_" + this.id + "_name' maxlength='255' name='register[partnerships_attributes][" + ($e($c(this.id))) + "][name]' size='50' type='text'>\n</td>\n<td class='col-sm-1'>\n  Cód:\n</td>\n<td class='col-sm-2'>\n  <input class='form-control optional string' id='register_partnerships_attributes_" + this.id + "_code' maxlength='255' name='register[partnerships_attributes][" + ($e($c(this.id))) + "][code]' size='50' type='text'>\n</td>\n<td class='col-sm-1'>\n  <a class='btn btn-danger btn-small remove'>\n    <div class='glyphicon glyphicon-remove'></div>\n  </a>\n</td>");
      return $o.join("\n").replace(/\s([\w-]+)='true'/mg, ' $1').replace(/\s([\w-]+)='false'/mg, '').replace(/\s(?:id|class)=(['"])(\1)/mg, "");
    }).call(window.HAML.context(context));
  };

}).call(this);
