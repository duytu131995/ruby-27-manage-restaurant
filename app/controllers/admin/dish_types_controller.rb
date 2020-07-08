class Admin::DishTypesController < AdminController
  before_action :load_dish_type, except: %i(new create index)

  def index
    @dish_types = DishType.all
  end

  def new
    @dish_type = DishType.new
  end

  def edit; end

  def create
    @dish_type = DishType.new dish_type_params
    if @dish_type.save
      flash[:success] = t "dish_types.create_success"
      redirect_to root_url
    else
      flash[:danger] = t "dish_types.create_error"
      render :new
    end
  end

  def show; end

  def update
    if @dish_type.update dish_type_params
      flash[:success] = t "dish_types.update_success"
      redirect_to admin_dish_types_path
    else
      flash[:danger] = t "dish_types.update_error"
      render :edit
    end
  end

  def destroy
    if @dish_type.destroy
      flash[:success] = t "dish_types.delete_success"
    else
      flash[:danger] = t "dish_types.delete_error"
    end
    redirect_to admin_dish_types_path
  end

  private

  def dish_type_params
    params.require(:dish_type).permit DishType::DISH_TYPES_PARAMS
  end

  def load_dish_type
    @dish_type = DishType.find_by id: params[:id]
    return if @dish_type

    flash[:danger] = t "dish_types.not_found"
    redirect_to admin_dish_types_path
  end
end
