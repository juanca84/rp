class Ability
  include CanCan::Ability

  def initialize(user)
    if user.module_administrador?
      can :read, ActiveAdmin::Page, :name => "Dashboard"
      can :manage, :all
    end

    if user.module_formulario?
      can :manage, [Register, Holder, Son]
    end
  end

end
