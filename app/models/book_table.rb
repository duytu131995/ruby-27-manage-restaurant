class BookTable < ApplicationRecord
  BOOK_TABLE_PARAMS = %i(start_time user_id status person).freeze
  belongs_to :user

  delegate :name, :phone, to: :user, prefix: true

  enum status: {pending: 0,
                checked: 1,
                received: 2,
                success: 3,
                cancel: 4}

  scope :sort_status, ->{order status: :asc}
  scope :by_attributes, ->(id){where user_id: id}
end
