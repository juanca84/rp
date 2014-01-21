class User < ActiveRecord::Base
  rolify

  devise :database_authenticatable, #:registerable,
    :recoverable, :rememberable, :trackable, :validatable, :lastseenable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :lastseenable, :active, 
                  :role_ids, :department_ids, :province_ids, :community_ids, :profile_attributes

  validates :email, presence: true, uniqueness: true

  scope :online_now, where("last_seen_at > ?", 5.minutes.ago)

  has_one :profile
  has_many :runpa_modules, through: :roles

  #asociasiones polimorfica para la region donde pertenece el usuario
  has_many :regions_users
  has_many :departments, through: :regions_users, :source => :regionable, :source_type => "Department"
  has_many :provinces,   through: :regions_users, :source => :regionable, :source_type => "Province"
  has_many :communities, through: :regions_users, :source => :regionable, :source_type => "Community"

  accepts_nested_attributes_for :profile

  before_destroy :not_admin

  #metodo para no eliminar al usuario administrador por defecto
  def not_admin
    false if self.email == "runpa.mdryt@gmail.com"
  end

  #metodo para crear roles dinamicamente o los roles iniciales
  roles = Roles.pluck(:name) rescue ['administrador', 'agente registrador']
  roles.each do |role|
    define_method("#{ role.gsub(/ /, '_') }?") do
      self.has_role?(role)
    end
  end

  #metodo para crear modulos de runpa 
  modules = ['administrador', 'formulario', 'reportes', 'servicio_web']
  modules.each do |mod|
    define_method("module_#{ mod.gsub(/ /, '_') }?") do
      self.runpa_modules.pluck(:name).include?(mod)
    end
  end

  #metodo para determinar si el usuario esta activo
  def active?
    active
  end

  #metodo para verificar si esta activo el usuario
  def active_for_authentication?
    super && self.active?
  end

  #metodo para definir el mensaje cuando el usuario esta desactivado
  def inactive_message
    "Lo siento, Esta cuenta ha sido desactivada."
  end

end
