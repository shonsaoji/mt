class CreateMedPostCategories < ActiveRecord::Migration
  def self.up
    create_table :med_post_categories do |t|
      t.string :title
      t.integer :plus_ratings
      t.integer :total_ratings
      t.timestamps
    end
  end

  def self.down
    drop_table :med_post_categories
  end
end
