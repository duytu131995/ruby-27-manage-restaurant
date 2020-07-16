class Order < ApplicationRecord
  belongs_to :user
  belongs_to :dinner_table
  has_many :order_items, dependent: :destroy

  enum payment_method: {cash: 0, card: 1}

  before_save :update_subtotal

  def subtotal
    order_items.map{|oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0}.sum
  end

  private

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
