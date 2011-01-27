class DepartmentsDoctors < ActiveRecord::Migration
  def self.up
    create_table :departments_doctors do |t|
      t.integer :department_id
      t.integer :doctor_id
    end
    add_index :departments_doctors, :department_id
    add_index :departments_doctors, :doctor_id
  end

  def self.down
    remove_index :departments_doctors, :department_id
    remove_index :departments_doctors, :doctor_id
    drop_table :departments_doctors
  end
end
