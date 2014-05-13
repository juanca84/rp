(function() {
  if (window.JST == null) {
    window.JST = {};
  }

  window.JST['backbone/templates/rows/new_person'] = function(context) {
    return (function() {
      var $c, $e, $o;
      $e = window.HAML.escape;
      $c = window.HAML.cleanValue;
      $o = [];
      $o.push("<td>\n  <input class='form-control optional string' id='register_" + this.type + "s_attributes_" + this.id + "_person_attributes_name' maxlength='255' name='register[" + ($e($c(this.type))) + "s_attributes][" + ($e($c(this.id))) + "][person_attributes][name]' size='50' type='text'>\n</td>\n<td>\n  <input class='form-control optional string' id='register_" + this.type + "s_attributes_" + this.id + "_person_attributes_first_lastname' maxlength='255' name='register[" + ($e($c(this.type))) + "s_attributes][" + ($e($c(this.id))) + "][person_attributes][first_lastname]' size='50' type='text'>\n</td>\n<td>\n  <input class='form-control optional string' id='register_" + this.type + "s_attributes_" + this.id + "_person_attributes_second_lastname' maxlength='255' name='register[" + ($e($c(this.type))) + "s_attributes][" + ($e($c(this.id))) + "][person_attributes][second_lastname]' size='50' type='text'>\n</td>\n<td>\n  <input class='form-control optional string' id='register_" + this.type + "s_attributes_" + this.id + "_person_attributes_age' name='register[" + ($e($c(this.type))) + "s_attributes][" + ($e($c(this.id))) + "][person_attributes][age]' size='50' type='text'>\n</td>\n<td>\n  <select class='form-control optional select' id='register_" + this.type + "s_attributes_" + this.id + "_person_attributes_sex' name='register[" + ($e($c(this.type))) + "s_attributes][" + ($e($c(this.id))) + "][person_attributes][sex]'>\n    <option value=''></option>\n    <option value='M'>M</option>\n    <option value='F'>F</option>\n  </select>\n</td>\n<td>\n  <input class='form-control optional string' id='register_" + this.type + "s_attributes_" + this.id + "_time_to_land' name='register[" + ($e($c(this.type))) + "s_attributes][" + ($e($c(this.id))) + "][time_to_land]' size='50' type='text' value='" + ($e($c(0))) + "'>\n</td>\n<td>\n  <input class='form-control optional string' id='register_" + this.type + "s_attributes_" + this.id + "_person_attributes_identification' maxlength='255' name='register[" + ($e($c(this.type))) + "s_attributes][" + ($e($c(this.id))) + "][person_attributes][identification]' size='50' type='text'>\n</td>\n<td>\n  <a class='btn btn-danger btn-xs remove'>\n    <div class='glyphicon glyphicon-remove'></div>\n  </a>\n</td>");
      return $o.join("\n").replace(/\s([\w-]+)='true'/mg, ' $1').replace(/\s([\w-]+)='false'/mg, '').replace(/\s(?:id|class)=(['"])(\1)/mg, "");
    }).call(window.HAML.context(context));
  };

}).call(this);
