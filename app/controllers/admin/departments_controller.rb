class Admin::DepartmentsController < AdminController
  before_action :find_department, only: %i(edit update destroy)
  before_action :get_departments, only: %i(update create index)

  def index; end

  def show; end

  def new
    @department = Department.new
  end

  def create
    @department = Department.create department_params
  end

  def edit; end

  def update
    @department.update_attributes department_params
  end

  def destroy
    @department.destroy
  end

  private

  def get_departments
    @departments = Department.all
  end

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
