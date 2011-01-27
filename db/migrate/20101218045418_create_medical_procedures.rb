class CreateMedicalProcedures < ActiveRecord::Migration
  def self.up
    create_table :medical_procedures do |t|

      t.timestamps
      t.string :name
      t.string :description, :limit => 1.kilobytes
      
    end
  end

  def self.down
    drop_table :medical_procedures
  end
end
