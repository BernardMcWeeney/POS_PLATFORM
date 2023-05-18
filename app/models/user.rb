class User < ApplicationRecord
  rolify
  
  has_many :memberships
  has_many :organisations, through: :memberships
  has_and_belongs_to_many :groups
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # def set_default_role
  #   if self.group.nil?
  #     self.add_role :group_manager
  #   else
  #     self.add_role :group_user
  #   end
  # end

  # after_create :assign_default_role

  # def assign_default_role
  #   self.add_role(:superuser) if self.roles.blank?
  # end
        
end
