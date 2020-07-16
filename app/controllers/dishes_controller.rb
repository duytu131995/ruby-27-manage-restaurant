class DishesController < ApplicationController
  before_action :find_dish, only: :show

  def index
    @dishes = Dish.in_stock.page(params[:page]).per 20
    @count = Dish.in_stock.count
  end

  def show
    @reviews = Review.where(dish_id: @dish.id).order("created_at DESC")

    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(2)
    end
  end

  private

  def find_dish
    @dish = Dish.find_by id: params[:id]
  end
end
