class DropUsers < ActiveRecord::Migration
  def up
  	drop_table :users
  end

  def down
  	create_table "users", :force => true do |t|
	    t.string   "email"
	    t.string   "password_hash"
	    t.string   "password_salt"
	    t.datetime "created_at",    :null => false
	    t.datetime "updated_at",    :null => false
	    t.string   "role"
	  end
  end
end
