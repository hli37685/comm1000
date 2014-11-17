module ApplicationHelper

	def slot_assigned_less_than_thirty
	 	Slot.where('assigned <= 29').order('list_order asc')
	end


end
