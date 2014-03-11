module PaperTrail
  class Version < ActiveRecord::Base
    attr_accessible :parent_id, :parent_type, :register_id

    scope :by_register, lambda { |register_id| where(register_id: register_id) }

    before_save :save_parent

    #definimos los clases padres
    def save_parent
      if (resource = self.reify).present?
          case resource.class.to_s
            when 'PeopleRegister'
              self.parent_id   = resource.register_id
              self.parent_type = 'Register'
              self.register_id = resource.register_id
            when 'Person'
              if resource.try(:people_registers).try(:size) == 1
                self.parent_id = resource.people_registers.first.id
                self.parent_type = 'PeopleRegister'
                self.register_id = resource.try(:registers).try(:first).try(:id)
              end
            when 'Register'
             self.register_id = id 
          end
      end 
    end
  end
end