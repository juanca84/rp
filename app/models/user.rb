class User < ActiveRecord::Base
  rolify

  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lastseenable

  attr_accessible :active, :community_ids, :department_ids, :email, :entity_id, :lastseenable, :password, :password_confirmation, 
                  :profile_attributes, :province_ids, :remember_me, :role_ids,
                  #para la migracion al nuevo sistema
                  :encrypted_password, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, 
                  :created_at, :updated_at, :last_seen_at



  validates :email, presence: true, uniqueness: true

  scope :online_now, where("last_seen_at > ?", 5.minutes.ago)

  belongs_to :entity

  has_one :profile, dependent: :destroy
  has_many :registers
  has_many :runpa_modules, through: :roles

  #asociasiones polimorficas para la region donde pertenece el usuario
  has_many :regions_users
  has_many :departments, through: :regions_users, :source => :regionable, :source_type => "Department"
  has_many :provinces,   through: :regions_users, :source => :regionable, :source_type => "Province"
  has_many :communities, through: :regions_users, :source => :regionable, :source_type => "Community"
  has_many :versions, class_name: 'PaperTrail::Version', foreign_key: :whodunnit
  has_many :templates

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

  #metodo para mostrar nombre completo
  def full_name
    "#{ profile.try(:name) } #{ profile.try(:last_name) } #{ profile.try(:second_last_name) }"
  end  

  #metodo para devolver un nombre o email

  def full_name_or_email 
    full_name.present? ? full_name : email    
  end

  #metodo para mostrar el ci del usuario 
  def identification
    "#{ profile.try(:identification) }"
  end

  #metodo para mostrar la razon social del usuario
  def business_name
    "#{ entity.try(:business_name) }"
  end

  #metodo para mostrar el nit o pj del usuario
  def nit
    "#{ entity.try(:nit) }"
  end

  #método para tomar el token usuario con una contraseña y si tiene habilitado el modulo servicio web
  def get_authentication_token(password)
    if active? && module_servicio_web? && valid_password?(password)
      new_authentication_token unless authentication_token.present?  
      authentication_token
    end
  end

  #metodo para generar token para el manejo de la API
  def new_authentication_token
    if active?  && module_servicio_web?
      self.update_attribute(:authentication_token, generate_authentication_token)
    end
  end

  #metodo para verificar si un token es valido
  def self.verify_token(token = nil)
    token.present? && (user = User.find_by_authentication_token(token)).present? && user.active? && user.module_servicio_web?
  end

  private

  #metodo para generar un nuevo authentication token
  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end

  #método para obtener la plantilla de este usuario
end