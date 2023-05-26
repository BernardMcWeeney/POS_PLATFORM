class Product < ApplicationRecord
  has_many :cart_items
  has_many :carts, through: :cart_items

  has_many :product_assignments
  has_many :locations, through: :product_assignments
  has_many :groups, through: :product_assignments  
  
  enum product_status: {
    draft: 0,
    published: 1,
    archived: 2,
    status_private: 3
  }

  has_one_attached :image
end
