class User < ActiveRecord::Base
  rolify

  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lastseenable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :lastseenable

  validates :email, presence: true, uniqueness: true

  scope :online_now, where("last_seen_at > ?", 5.minutes.ago)

  def admin?
    has_role? :admin
  end

end
