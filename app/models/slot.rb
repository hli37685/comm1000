class Slot < ActiveRecord::Base

has_many :users

def slot_assigned_less_than_thirty
	 Slot.where('assigned < 30').order('list_order asc')
end

end