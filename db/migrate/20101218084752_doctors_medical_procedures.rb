class DoctorsMedicalProcedures < ActiveRecord::Migration
  def self.up
    create_table :doctors_medical_procedures do |t|

      t.timestamps
      t.integer :doctor_id
      t.integer :medical_procedure_id
      t.float :cost
    end
    add_index :doctors_medical_procedures, :doctor_id
    add_index :doctors_medical_procedures, :medical_procedure_id
  end

  def self.down
    remove_index :doctors_medical_procedures, :doctor_id
    remove_index :doctors_medical_procedures, :medical_procedure_id
    drop_table :doctors_medical_procedures
  end
end
