class DinnerTable < ApplicationRecord
  has_many :orders, dependent: :destroy

  enum status: {free: 0, using: 1}
end
