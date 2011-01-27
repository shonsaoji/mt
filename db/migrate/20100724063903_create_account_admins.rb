class CreateAccountAdmins < ActiveRecord::Migration
  def self.up
    create_table :account_admins do |t|

      t.timestamps
      t.integer :user_id
      t.integer :account_id
      
    end
  end

  def self.down
    drop_table :account_admins
  end
end
