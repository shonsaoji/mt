class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table "users", :force => true do |t|
      t.column :user_name,                    :string,  :limit => 40
      t.column :name,                            :string,  :limit => 100, :default => '', :null => true
      t.column :email,                            :string,  :limit => 100
      t.string :phone,                                         :limit => 13
      t.column :crypted_password,          :string, :limit => 40
      t.column :salt,                               :string,  :limit => 40
      t.column :created_at,                     :datetime
      t.column :updated_at,                    :datetime
      t.column :remember_token,            :string, :limit => 40
      t.column :remember_token_expires_at, :datetime

      # extraa columns after restful authentication

      # extra columns added to identify admin or account
      t.integer :admin
      t.integer :account_id

    end
    add_index :users, :user_name, :unique => true
    add_index :users, :email, :unique => true
  end
 
  def self.down
    remove_index :users, :user_name
    remove_index :users, :email
    drop_table "users"
  end
end

