class CommentsController < ApplicationController
  before_action :find_commentable, only: %i(new create)

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.build comment_params
    if @comment.save
      respond_to :js
    else
      redirect_back fallback_location: root_path
    end
  end

  def destroy
    @comment = Comment.find_by id: params[:id]
    if @comment.destroy
      respond_to :js
    else
      redirect_back fallback_location: root_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit :content
  end

  def find_commentable
    @commentable = Comment.find_by(id: params[:comment_id]) || Dish.find_by(id: params[:dish_id])
    return if @commentable

    flash[:danger] = t "comment.not_found"
    redirect_to root_path
  end
end
