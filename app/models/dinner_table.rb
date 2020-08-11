class DinnerTable < ApplicationRecord
  has_many :orders, dependent: :destroy

  enum status: {free: 0, using: 1, paid: 2, unpaid: 3}

  DINNER_TABLE_PARAMS = %i(status table_number).freeze

  scope :filter_status, ->(status){where("status = ?", status) if status.present?}
  scope :order_by_table_numnber, ->{order table_number: :asc}
end
