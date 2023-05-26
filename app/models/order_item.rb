class OrderItem < ApplicationRecord
  belongs_to :order

  validates :quantity, presence: true
  validates :price, presence: true
  validates :tax, presence: true

  def calculate_total
    self.total = price * quantity
    save
  end
end