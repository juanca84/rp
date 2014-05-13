(function() {
  var _base,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  (_base = Runpa.Views).Rows || (_base.Rows = {});

  Runpa.Views.Rows.NewView = (function(_super) {
    __extends(NewView, _super);

    function NewView() {
      return NewView.__super__.constructor.apply(this, arguments);
    }

    NewView.prototype.new_capital_tmp = JST["backbone/templates/rows/new_capital"];

    NewView.prototype.new_land_tmp = JST["backbone/templates/rows/new_land"];

    NewView.prototype.new_partnership_tmp = JST["backbone/templates/rows/new_partnership"];

    NewView.prototype.new_person_tmp = JST["backbone/templates/rows/new_person"];

    NewView.prototype.new_production_tmp = JST["backbone/templates/rows/new_production"];

    NewView.prototype.new_work_tmp = JST["backbone/templates/rows/new_work"];

    NewView.prototype.events = {
      "click .remove": "remove"
    };

    NewView.prototype.tagName = "tr";

    NewView.prototype.remove = function() {
      var id_land;
      id_land = this.el.id;
      console.log(id_land);
      $("#" + id_land.replace("land", "work")).remove();
      $("#" + id_land.replace("land", "capital")).remove();
      return this.el.remove();
    };

    NewView.prototype.initialize = function() {
      this.id = this.options.tr_id;
      this.type = this.options.type;
      _.bindAll(this, "render");
      return this.render();
    };

    NewView.prototype.render = function() {
      var parent_id;
      if (this.type === "aggregate") {
        $(this.el).html(this.new_person_tmp({
          id: this.id,
          type: this.type
        }));
      } else if (this.type === "land") {
        $(this.el).html(this.new_land_tmp({
          id: this.id
        }));
      } else if (this.type === "partnership") {
        $(this.el).html(this.new_partnership_tmp({
          id: this.id
        }));
      } else if (this.type === "son") {
        $(this.el).html(this.new_person_tmp({
          id: this.id,
          type: this.type
        }));
      } else if (this.type === "work") {
        $(this.el).html(this.new_work_tmp({
          id: this.id
        }));
      } else if (this.type.indexOf("capital") !== -1) {
        parent_id = this.type.replace('land-', '').replace('-capital', '');
        $(this.el).html(this.new_capital_tmp({
          id: this.id,
          parent_id: parent_id
        }));
      } else if (this.type.indexOf("production") !== -1) {
        parent_id = this.type.replace('land-', '').replace('-production', '');
        $(this.el).html(this.new_production_tmp({
          id: this.id,
          parent_id: parent_id
        }));
      }
      return this;
    };

    return NewView;

  })(Backbone.View);

}).call(this);
