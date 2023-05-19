class User < ApplicationRecord
  rolify
  
  has_many :memberships
  has_many :organisations, through: :memberships
  has_many :groups, through: :memberships
  has_one :address, dependent: :destroy, inverse_of: :user, autosave: true
  accepts_nested_attributes_for :address

  validates :first_name, presence: true
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

 
  after_create :assign_default_role

  def assign_default_role
    self.add_role(:platform_user) if self.roles.blank?
  end

  def onboarding_incomplete?
    !self.onboarding_completed
  end
  

end
