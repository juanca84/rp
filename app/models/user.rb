class User < ActiveRecord::Base
  rolify

  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lastseenable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :lastseenable

  validates :email, presence: true, uniqueness: true

  def is_admin?
    has_role? :admin
  end
end
