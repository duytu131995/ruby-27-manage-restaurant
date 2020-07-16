class Dish < ApplicationRecord
  DISHES_PARAMS = [:name, :price, :description, :dish_type_id, :status,
    images_attributes: [:id, :image, :image_cache, :_destroy]].freeze

  belongs_to :dish_type
  has_many :images, dependent: :destroy
  has_many :order_items, dependent: :destroy
  has_many :reviews, dependent: :destroy

  accepts_nested_attributes_for :images, allow_destroy: true, reject_if: :all_blank

  enum status: {out_of_stock: 0, in_stock: 1}

  scope :search, (lambda do |param|
    where("name LIKE '%#{param}%'").or(where("description LIKE '%#{param}%'")) if param.present?
  end)
  scope :in_stock, ->{where status: "in_stock"}
  scope :searchDish, ->(parameter){where("name LIKE :search", search: "%#{parameter}%").or(where("description LIKE :search", search: "%#{parameter}%"))}
end
