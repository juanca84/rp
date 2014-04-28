#encoding: UTF-8

module PaperTrail
  class Version < ActiveRecord::Base

    default_scope order('versions.created_at DESC') 

    attr_accessible :parent_id, :parent_type, :register_id

    belongs_to :user, class_name: 'User', foreign_key: :whodunnit

    scope :all_versions, lambda { |register_id| where("(item_id = ? AND item_type = ?) OR (register_id = ? )", register_id, 'Register', register_id) }
    scope :by_item_type, lambda { |item_type|   where("item_type = ?", item_type) }
    scope :by_item_id,   lambda { |item_id|     where("item_id = ?", item_id) }
    scope :by_event,     lambda { |event|       where("event = ?", event) }

    before_create :add_owner_register

    #metodo para determinar el tipo de 
    ["update", "create", "destroy"].each do |e|
      define_method("#{ e }?") do
        self.event == e
      end
    end

    #metodo para definir la propiedad de los registros
    def add_owner_register
      if update? 
        self.register_id = item.try(:register).try(:id) unless item.is_a?(Register)
      elsif create?
        if item_type == 'PeopleRegister' && item.present? && (person_id = item.person_id).present?
          version_person = PaperTrail::Version.by_item_type('Person').by_item_id(person_id).by_event('create').first
          version_person.update_attribute(:register_id, item.register.id) if version_person.present?
        end
        self.register_id = item.try(:register).try(:id) unless item.is_a?(Register)
      elsif destroy?
        if item_type == 'PeopleRegister' &&  (person_id = YAML.load(object)["person_id"]).present?
          version_person = PaperTrail::Version.by_item_type('Person').by_item_id(person_id).by_event('destroy').first
          version_person.update_attribute(:register_id, reify.register.id) if version_person.present?
        end
        self.register_id = reify.try(:register).try(:id) unless reify.is_a?(Register)
      end
    end

    def type_class
      case item_type
        when 'PeopleRegister'
          'PERSONA REGISTRO'
        when 'Person'
          'PERSONA'
        when 'Partnership'
          'ASOCIACIÓN'
        when 'Land'
          'TIERRA'
        when 'Capital'
          'CAPITAL'
        when 'Production'
          'PRODUCCIÓN'
        when 'Register'
          'REGISTER'
      end
    end
  end
end