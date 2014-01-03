class User < ActiveRecord::Base
  rolify

  devise :database_authenticatable, #:registerable,
    :recoverable, :rememberable, :trackable, :validatable, :lastseenable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :lastseenable, :role_ids, :department_ids, :profile_attributes

  validates :email, presence: true, uniqueness: true

  scope :online_now, where("last_seen_at > ?", 5.minutes.ago)

  has_one :profile
  has_many :departments_users
  has_many :departments, through: :departments_users

  accepts_nested_attributes_for :departments, :profile

  before_destroy :not_admin

  def not_admin
    false if self.email == "runpa.mdryt@gmail.com"
  end

  roles = Roles.pluck(:name) rescue ['administrador', 'agente registrador']

  roles.each do |role|
    define_method("#{ role.gsub(/ /, '_') }?") do
      self.has_role?(role)
    end
  end

end
