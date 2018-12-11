class EmployeesController < ApplicationController
  before_action :find_company, only: [:create, :destroy]
  def new
    @product = Product.new
  end

  def create
    @employee = Employee.new(employee_params)
    @employee.company = @company
    @employee.save
    redirect_to @employee.company
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to @employee.company
  end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :email, :area_id, :company_id)
  end

  def find_company
    @company = Company.find(params[:company_id])
  end
end
