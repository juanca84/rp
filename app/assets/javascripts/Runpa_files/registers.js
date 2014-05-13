(function() {
  var _base,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  (_base = Runpa.Views).Registers || (_base.Registers = {});

  Runpa.Views.Registers.NewView = (function(_super) {
    __extends(NewView, _super);

    function NewView() {
      return NewView.__super__.constructor.apply(this, arguments);
    }

    NewView.prototype.el = '.container.main';

    NewView.prototype.events = {
      "click .add_son": "add_row",
      "click .add_aggregate": "add_row",
      "click .add_partnership": "add_row",
      "click .add_land": "add_row",
      "click .add_capital": "add_row",
      "click .add_production": "add_row",
      "change #department_holder": "update_communities",
      "change #department_register": "update_communities",
      "change .department_lands": "update_communities",
      "change .province_lands": "update_communities_by_province",
      "change .community_lands": "update_another_communities",
      "click .remove-static-field": "remove_static_field"
    };

    NewView.prototype.initialize = function() {
      _.bindAll(this, "render", "add_row");
      return this.render();
    };

    NewView.prototype.add_row = function(e) {
      var tr_id, type, view;
      type = $(e.currentTarget).attr('data-type');
      tr_id = this.generate_id();
      view = new Runpa.Views.Rows.NewView({
        id: type + "-" + tr_id,
        tr_id: tr_id,
        type: type
      });
      this.$('table.table_' + type + 's tbody tr:last').after(view.render().el);
      return false;
    };

    NewView.prototype.remove_static_field = function(event) {
      var id, row;
      row = $(event.currentTarget).parent().parent();
      row.addClass('hide');
      id = $(row).attr('id');
      if (id.indexOf('land') !== -1) {
        return $('#' + id.replace('land', 'work')).remove();
      }
    };

    NewView.prototype.generate_id = function() {
      return new Date().getTime();
    };

    NewView.prototype.update_communities = function(event) {
      var department_id, element, select_id;
      element = $(event.currentTarget);
      select_id = element.attr('id');
      console.log(select_id);
      department_id = element.val();
      $.ajax({
        url: '/registers/' + department_id + '/get_provinces',
        dataType: 'html'
      }).success(function(data) {
        $('#' + select_id.replace('department', 'province')).html(data);
        $('#' + select_id.replace('department_lands_', 'work-') + ' .department').val($('#' + select_id + ' option:selected').text());
        return $('#' + select_id.replace('department_lands_', 'capital-') + ' .department').val($('#' + select_id + ' option:selected').text());
      });
      $.ajax({
        url: '/registers/' + department_id + '/get_communities',
        dataType: 'html'
      }).success(function(data) {
        $('#' + select_id.replace('department', 'community')).html(data);
        $('#' + select_id.replace('department_lands_', 'work-') + ' .department').val($('#' + select_id + ' option:selected').text());
        return $('#' + select_id.replace('department_lands_', 'capital-') + ' .department').val($('#' + select_id + ' option:selected').text());
      });
      return false;
    };

    NewView.prototype.update_communities_by_province = function(event) {
      var element, province_id, select_id;
      element = $(event.currentTarget);
      select_id = element.attr('id');
      province_id = element.val();
      $.ajax({
        url: '/registers/' + province_id + '/get_communities?province=true',
        dataType: 'html'
      }).success(function(data) {
        return $('#' + select_id.replace('province', 'community')).html(data);
      });
      return false;
    };

    NewView.prototype.update_another_communities = function(event) {
      var element, select_id;
      element = $(event.currentTarget);
      select_id = element.attr('id');
      $('#' + select_id.replace('community_lands_', 'work-') + ' .community').val($('#' + select_id + ' option:selected').text());
      $('#' + select_id.replace('community_lands_', 'capital-') + ' .community').val($('#' + select_id + ' option:selected').text());
      return false;
    };

    NewView.prototype.render = function() {
      return this;
    };

    return NewView;

  })(Backbone.View);

}).call(this);
