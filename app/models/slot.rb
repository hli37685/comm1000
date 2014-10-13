class Slot < ActiveRecord::Base

has_many :users

def update_slot_row_count
	slot.assigned = Slot.where('slots.assigned = params.slot_id').count
	slot.save
end 

end