module PaperTrail
  class Version < ActiveRecord::Base

    default_scope order('created_at DESC') 

    attr_accessible :parent_id, :parent_type, :register_id

    belongs_to :user, class_name: 'User', foreign_key: :whodunnit

    scope :all_versions, lambda { |register_id| where("(item_id = ? AND item_type = ?) OR (register_id = ? )", register_id, 'Register', register_id)   }

    before_save :add_owner_register

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
        debugger
        puts 'unos'
      elsif destroy?
      end
        
        
      # if (resource = self.reify).present?
      #     case resource.class.to_s
      #       when 'PeopleRegister'
      #         self.parent_id   = resource.register_id
      #         self.parent_type = 'Register'
      #         self.register_id = resource.register_id
      #       when 'Person'debugger
      puts 'unos'
      #         if resource.try(:people_registers).try(:size) == 1
      #           self.parent_id = resource.people_registers.first.id
      #           self.parent_type = 'PeopleRegister'
      #           self.register_id = resource.try(:registers).try(:first).try(:id)
      #         end
      #       when 'Register'
      #        self.register_id = id 
      #     end
      # end 
    end
  end
end