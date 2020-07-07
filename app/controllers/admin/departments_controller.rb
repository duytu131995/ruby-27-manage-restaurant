class Admin::DepartmentsController < AdminController
  before_action :find_department, only: %i(edit update destroy)

  def index
    @departments = Department.all
    @department = Department.new
  end

  def show; end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new department_params
    if @department.save
      render json: {
        department_data: render_to_string(@department)
      }, status: :ok
    else
      render error, status: :unauthorized
    end
  end

  def edit; end

  def update
    if @department.update_attributes department_params
      flash[:success] = t "admin.departments.update.success"
      redirect_to admin_departments_path
    else
      flash[:danger] = t "admin.departments.update.danger"
      render :edit
    end
  end

  def destroy
    if @department.destroy
      flash[:success] = t "admin.departments.destroy.success"
    else
      flash[:danger] = t "admin.departments.destroy.danger"
    end
    redirect_to admin_departments_path
  end

  private

  def department_params
    params.require(:department).permit Department::DEPARTMENT_PARAMS
  end

  def find_department
    @department = Department.find_by id:params[:id]
    return if @department

    flash[:danger] = t "find_department.danger"
    redirect_to admin_departments_path @department
  end
end
