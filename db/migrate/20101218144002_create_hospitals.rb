class CreateHospitals < ActiveRecord::Migration
  def self.up
    create_table :hospitals do |t|

      t.timestamps
      t.string   :name

      # have hospitals connected to accounts - eg. Apollo Hospitals have one account
      t.string   :address
      t.string   :city
      t.string   :state
      t.string   :country
      t.string   :zipcode
      t.integer  :user_id
      t.string :description, :limit => 1.kilobytes
    end
    add_index :hospitals, :city
    add_index :hospitals, :state
    add_index :hospitals, :country
    add_index :hospitals, :zipcode
    add_index :hospitals, :user_id
  end

  def self.down
    remove_index :hospitals, :city
    remove_index :hospitals, :state
    remove_index :hospitals, :country
    remove_index :hospitals, :zipcode
    remove_index :hospitals, :user_id
    drop_table :hospitals
  end
end
