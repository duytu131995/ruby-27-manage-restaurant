class OrderItem < ApplicationRecord
  ORDER_ITEMS_PARAMS = %i(quantity dish_id).freeze

  belongs_to :order
  belongs_to :dish

  enum status: {pending: 0, success: 1}

  validates :quantity, presence: true,
             numericality: {only_integer: true, greater_than: 0}

  before_save :finalize

  def unit_price
    if persisted?
      self[:unit_price]
    else
      dish.price
    end
  end

  def total_price
    unit_price * quantity
  end

  private

  def finalize
    self[:unit_price] = unit_price
    self[:total] = quantity * self[:unit_price]
  end
end
