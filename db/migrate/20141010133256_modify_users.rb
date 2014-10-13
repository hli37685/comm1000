class ModifyUsers < ActiveRecord::Migration
  def change
  	add_column :users, :instructor_id, :integer
  end
end
