(function() {
  if (window.JST == null) {
    window.JST = {};
  }

  window.JST['backbone/templates/rows/new_capital'] = function(context) {
    return (function() {
      var $c, $e, $o;
      $e = window.HAML.escape;
      $c = window.HAML.cleanValue;
      $o = [];
      $o.push("<td>\n  <div class='col-sm-12'>\n    <div class='control-group form-group optional register_lands_department select'>\n      <div class='control'>\n        <select class='department_lands form-control optional select' id='department_lands_" + this.id + "' name='register[capitals_attributes][" + ($e($c(this.id))) + "][department_id]'>\n          <option></option>\n          <option value='8'>Beni</option>\n          <option value='3'>Chuquisaca</option>\n          <option value='6'>Cochabamba</option>\n          <option value='7'>La Paz</option>\n          <option value='5'>Oruro</option>\n          <option value='9'>Pando</option>\n          <option value='2'>Potosi</option>\n          <option value='4'>Santa Cruz</option>\n          <option value='1'>Tarija</option>\n        </select>\n      </div>\n    </div>\n  </div>\n</td>\n<td>\n  <div class='col-sm-12'>\n    <div class='control-group form-group optional register_lands_community select'>\n      <div class='control'>\n        <select class='community_lands form-control optional select' id='community_lands_" + this.id + "' name='register[capitals_attributes][" + ($e($c(this.id))) + "][community_id]'>\n          <option value=''></option>\n        </select>\n      </div>\n    </div>\n  </div>\n</td>\n<td>\n  <input class='form-control optional string' id='register_capitals_attributes_" + this.parent_id + "_capitals_attributes_" + this.id + "_capital_item' maxlength='255' name='register[capitals_attributes][" + ($e($c(this.id))) + "][capital_item]' size='50' type='text'>\n</td>\n<td>\n  <input class='form-control integer numeric optional' id='register_capitals_attributes_" + this.parent_id + "_capitals_attributes_" + this.id + "_start_year' name='register[capitals_attributes][" + ($e($c(this.id))) + "][start_year]' type='text'>\n</td>\n<td>\n  <input class='float form-control numeric optional' id='register_capitals_attributes_" + this.parent_id + "_capitals_attributes_" + this.id + "_current_value' name='register[capitals_attributes][" + ($e($c(this.id))) + "][current_value]' type='text' value='0.0'>\n</td>\n<td>\n  <a class='btn btn-danger btn-xs remove'>\n    <div class='glyphicon glyphicon-remove'></div>\n  </a>\n</td>");
      return $o.join("\n").replace(/\s([\w-]+)='true'/mg, ' $1').replace(/\s([\w-]+)='false'/mg, '').replace(/\s(?:id|class)=(['"])(\1)/mg, "");
    }).call(window.HAML.context(context));
  };

}).call(this);
