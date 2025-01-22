module EmployeeViewHelper
  def investment_banker?(employee)
    employee.position_type&.name == "Investment Banker"
  end
end 
