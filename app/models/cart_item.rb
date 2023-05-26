class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  validates :quantity, presence: true
  validates :price, presence: true
  validates :tax, presence: true

  def calculate_total
    self.total = price * quantity
    self.save
  end
end
