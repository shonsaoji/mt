class CreateMedReplies < ActiveRecord::Migration
  def self.up
    create_table :med_replies do |t|
      t.integer :user_id
      t.integer :med_post_id
      t.string :content

      t.timestamps
    end
  end

  def self.down
    drop_table :med_replies
  end
end
