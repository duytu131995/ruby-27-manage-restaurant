class DishesController < ApplicationController
  def index
    @search = Dish.search(params[:q])
    @dishs = @search.result.includes(:images).page(params[:page]).per Settings.dishes.per_page
  end

  def show
    @dish = Dish.find_by id: params[:id]
    return if @dish

    flash[:danger] = t "comment.not_found"
    redirect_to root_path
  end
end
