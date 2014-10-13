class ChangeTypes < ActiveRecord::Migration
  def change
  	change_column :slots, :list_order, :integer
  	change_column :slots, :assigned, :integer
  end
end
