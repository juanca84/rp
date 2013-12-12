class User < ActiveRecord::Base
  rolify

  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lastseenable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :lastseenable, :role_ids

  validates :email, presence: true, uniqueness: true

  scope :online_now, where("last_seen_at > ?", 5.minutes.ago)

  before_destroy :not_admin

  def admin?
    has_role? :administrador
  end

  def not_admin
    false if self.email == "runpa.mdryt@gmail.com"
  end

end
