class MedicalProcedure < ActiveRecord::Base
  has_many :departments_medical_procedures
  has_many :departments, :through => :departments_medical_procedures
end
