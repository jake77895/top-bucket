class EmployeeViewsController < ApplicationController
  def show
    @page = Page.find(params[:id])
    @employee_view = @page.page_associations.find_by.not(employee_view_id: nil)&.employee_view
  end
end
