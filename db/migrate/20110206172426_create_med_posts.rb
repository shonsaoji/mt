class CreateMedPosts < ActiveRecord::Migration
  def self.up
    create_table :med_posts do |t|
      t.integer :user_id
      t.string :title
      t.string :content
      t.integer :med_post_category_id
      t.integer :plus_ratings
      t.integer :total_ratings

      t.timestamps
    end
  end

  def self.down
    drop_table :med_posts
  end
end
