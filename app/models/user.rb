class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :organisation_memberships
  has_many :organisations, through: :organisation_memberships
  has_many :group_memberships
  has_many :groups, through: :group_memberships
  has_many :location_memberships
  has_many :locations, through: :location_memberships
  validates :first_name, presence: true

  has_many :carts
  has_many :orders

  rolify

  after_create :assign_default_role

  def assign_default_role
    self.add_role(:platform_user) if self.roles.blank?
  end

  def onboarding_incomplete?
    !self.onboarding_completed
  end

  def cart_for_location(location)
    self.carts.find_or_create_by(location: location)
  end

end
