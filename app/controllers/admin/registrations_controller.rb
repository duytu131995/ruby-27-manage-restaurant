class Admin::RegistrationsController < Devise::RegistrationsController
  layout "admin"

  def new
    @departments = Department.pluck(:name, :id)
    super
  end
end
