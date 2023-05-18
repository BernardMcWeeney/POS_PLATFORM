class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  before_save :set_default_role

  def set_default_role
    self.role ||= :guest
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  enum role: { guest: 0, superadmin: 1, group_manager: 20, group_user: 21, store_manager: 30, store_user: 31, }

end
