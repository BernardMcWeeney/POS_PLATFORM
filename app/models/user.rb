class User < ApplicationRecord
  rolify
  belongs_to :group
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def set_default_role
    if self.group.nil?
      self.add_role :group_manager
    else
      self.add_role :group_user
    end
  end
        
end
