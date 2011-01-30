class CreateDepartmentsMedicalProcedures < ActiveRecord::Migration
  def self.up
    create_table :departments_medical_procedures do |t|

      t.timestamps
      t.integer :department_id
      t.integer :medical_procedure_id
      t.float :cost
    end
    add_index :departments_medical_procedures, :department_id
    add_index :departments_medical_procedures, :medical_procedure_id
  end

  def self.down
    remove_index :departments_medical_procedures, :department_id
    remove_index :departments_medical_procedures, :medical_procedure_id
    drop_table      :departments_medical_procedures
  end
end
