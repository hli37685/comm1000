class ChangeTypes < ActiveRecord::Migration
  def change
  	#change_column :slots, :list_order, :integer
  	#change_column :slots, :assigned, :integer
  	remove_column :slots, :list_order
  	remove_column :slots, :assigned
  	add_column :slots, :list_order, :integer
  	add_column :slots, :assigned, :integer
  end
end
