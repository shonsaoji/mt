class DepartmentsMedicalProcedure < ActiveRecord::Base
  belongs_to :department
  belongs_to :medical_procedure
end
