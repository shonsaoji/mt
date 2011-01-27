class CreateDoctors < ActiveRecord::Migration
  def self.up
    create_table :doctors do |t|

      t.timestamps
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.string :zipcode
      t.string :url
      t.integer :user_id
    end
      add_index :doctors, :city
      add_index :doctors, :state
      add_index :doctors, :country
      add_index :doctors, :zipcode
      add_index :doctors, :user_id

  end

  def self.down
    remove_index :doctors, :city
    remove_index :doctors, :state
    remove_index :doctors, :country
    remove_index :doctors, :zipcode
    remove_index :doctors, :user_id
    drop_table :doctors
  end
end
