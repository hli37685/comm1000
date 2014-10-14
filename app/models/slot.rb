class Slot < ActiveRecord::Base

has_many :users

def update_slot_row_count
	slot.assigned = User.where('slot_id = params.slot_id').count
	slot.save
end 

end