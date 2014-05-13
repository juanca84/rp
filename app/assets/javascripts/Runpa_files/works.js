(function() {
  var _base,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  (_base = Runpa.Views).Works || (_base.Works = {});

  Runpa.Views.Works.NewView = (function(_super) {
    __extends(NewView, _super);

    function NewView() {
      return NewView.__super__.constructor.apply(this, arguments);
    }

    NewView.prototype.el = 'table.table_works';

    NewView.prototype.events = {
      "keyup  td input": "update_summations"
    };

    NewView.prototype.initialize = function() {
      this.total = $('#total_time_to_land').val();
      this.total2 = this.options.total;
      _.bindAll(this, "render");
      this.update_summations();
      return this.render();
    };

    NewView.prototype.update_summations = function(event) {
      var eventual_labor, men_per_year_eventually, men_per_year_own, men_per_year_total, own_labor, permanent_labor, tr_id;
      if (event) {
        tr_id = $($(event.currentTarget).parent().parent()).attr('id');
      } else {
        tr_id = $(".work")[0].id;
      }
      $('#' + tr_id).find('input.own_labor');
      own_labor = $('#' + tr_id).find('input.own_labor');
      eventual_labor = $('#' + tr_id).find('input.eventual_labor');
      permanent_labor = $('#' + tr_id).find('input.permanent_labor');
      men_per_year_own = $('#' + tr_id).find('input.men_per_year_own');
      men_per_year_eventually = $('#' + tr_id).find('input.men_per_year_eventually');
      men_per_year_total = $('#' + tr_id).find('input.men_per_year_total');
      men_per_year_own.val(this.integer_val(own_labor.val()) / 250);
      men_per_year_eventually.val(this.integer_val(eventual_labor.val()) / 250);
      return men_per_year_total.val(parseFloat(men_per_year_own.val()) + parseFloat(men_per_year_eventually.val()) + this.integer_val(permanent_labor.val()));
    };

    NewView.prototype.integer_val = function(value) {
      if (Math.floor(value).toString() === value.toString() && $.isNumeric(value)) {
        return parseInt(value);
      } else {
        return 0;
      }
    };

    NewView.prototype.render = function() {
      return this;
    };

    return NewView;

  })(Backbone.View);

}).call(this);
