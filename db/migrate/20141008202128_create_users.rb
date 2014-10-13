class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
	    t.string :firstname
	    t.string :lastname
	    t.string :email
	    t.string :password_digest
	    t.string :slug
	    t.string :role
	    t.integer :slot_id
	    t.timestamps		
    end
  end
end
