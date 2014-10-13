module ApplicationHelper

	def slot_assigned_less_than_thirty
	 	Slot.where('assigned < 30').order('list_order asc')
	end

	def updated_slot_row_count
		slot.assigned = Slot.where('slots.assigned = params.slot_id').count
		slot.save
	end
end
