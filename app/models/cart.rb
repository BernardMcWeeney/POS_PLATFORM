class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :location
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items

  def checkout!
    order = Order.create!(user: user, location: location)
    cart_items.each do |cart_item|
      OrderItem.create!(
        order: order,
        name: cart_item.name,
        quantity: cart_item.quantity,
        price: cart_item.price,
        tax: cart_item.tax
      )
    end
    destroy!
    order
  end

  def calculate_total
    self.total = cart_items.sum(&:total)
    self.tax = cart_items.sum(&:tax)
    self.save
  end
end