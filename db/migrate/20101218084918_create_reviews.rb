class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|

      t.timestamps
      t.string :description, :limit => 1.kilobytes
      t.string :author
      t.integer :stars_rating
      t.integer :department_id
      t.integer :medical_procedure_id           
    end
    add_index :reviews, :department_id
    add_index :reviews, :medical_procedure_id
    add_index :reviews, :stars_rating
  end

  def self.down
    remove_index :reviews, :department_id
    remove_index :reviews, :medical_procedure_id
    remove_index :reviews, :stars_rating
    drop_table :reviews
  end
end
