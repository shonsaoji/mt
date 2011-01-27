class CreateDepartments < ActiveRecord::Migration
  def self.up
    create_table :departments do |t|

      t.timestamps
      t.string :name
      t.integer :hospital_id
      t.string :description
    end
    add_index :departments, :name
    add_index :departments, :hospital_id
  end

  def self.down
    remove_index :departments, :name
    remove_index :departments, :hospital_id
    drop_table :departments
  end
end
