class Dish < ApplicationRecord
  DISHES_PARAMS = [:name, :price, :description, :dish_type_id, :status,
    images_attributes: [:id, :image, :image_cache, :_destroy]].freeze

  belongs_to :dish_type
  has_many :images, dependent: :destroy
  has_many :order_item, dependent: :delete_all
  has_many :comments, as: :commentable, dependent: :destroy

  validates :name,  presence: true
  validates :price, numericality:
            {greater_than_or_equal_to: Settings.dishes.price.min_value},
             length: {maximum: Settings.dishes.price.max_length}

  accepts_nested_attributes_for :images, allow_destroy: true, reject_if: :all_blank

  enum status: {out_of_stock: 0, in_stock: 1}, _suffix: true

  scope :by_attributes, (lambda do |param|
    where("name LIKE :search", search: "%#{param}%").or(where("description LIKE :search", search: "%#{param}%"))
  end)
  scope :by_created_at, ->{order created_at: :desc}
end
