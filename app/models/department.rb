class Department < ActiveRecord::Base
  has_many :departments_medical_procedures
  has_many :medical_procedures, :through => :departments_medical_procedures

  belongs_to :hospital
end
