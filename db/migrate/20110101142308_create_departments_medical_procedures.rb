class CreateDepartmentsMedicalProcedures < ActiveRecord::Migration
  def self.up
    create_table :departments_medical_procedures do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :departments_medical_procedures
  end
end
