class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
    	t.string :description
    	t.string :list_order
    	t.string :assigned
    	t.timestamps
    end
  end
end
