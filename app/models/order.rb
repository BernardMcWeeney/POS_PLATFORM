class Order < ApplicationRecord
  belongs_to :location
  belongs_to :user

  has_many :order_items, dependent: :destroy

  def calculate_total
    self.total_price = order_items.sum('price * quantity')
    self.save
  end
end