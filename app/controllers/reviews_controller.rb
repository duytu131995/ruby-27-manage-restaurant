class ReviewsController < ApplicationController
  before_action :find_review, only: [:edit, :update, :destroy]
  before_action :find_dish
  before_action :logged_in_user, only: %i(create destroy)

  def new
    @review = Review.new
  end

  def edit; end

  def create
    @review = Review.new params_review
    @review.user_id = current_user.id if current_user
    @review.dish_id = @dish.id
    if @review.save
      flash[:success] = t ".success"
      redirect_to @dish
    else
      flash[:danger] = t ".danger"
      redirect_to new_dish_review_path
    end
  end

  def update
    if @review.update params_review
      flash[:success] = t ".success"
      redirect_to @dish
    else
      flash[:danger] = t ".danger"
      render "edit"
    end
  end

  def destroy
    @review.destroy
  end

  private

  def find_review
    @review = Review.find_by id: params[:id]
    return if @review

    flash[:danger] = t ".find_user.danger"
    redirect_to root_path
  end

  def find_dish
    @dish = Dish.find_by id: params[:dish_id]
    return if @dish

    flash[:danger] = t ".find_user.danger"
    redirect_to root_path
  end

  def params_review
    params.require(:review).permit Review::REVIEW_PARAMS
  end
end
