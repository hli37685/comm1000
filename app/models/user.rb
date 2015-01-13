class User < ActiveRecord::Base
#include Sluggable

belongs_to :slot
belongs_to :instructor


has_secure_password validations: false

validates :email, presence: true, uniqueness: true
validates_length_of :email, :minimum => 7, :maximum => 7, :allow_blank => false, on: :create, :message => "is not requested.  Instead enter you Auburn UserID." 
validates :password, presence: true, on: :create, length: {minimum: 8}


 scope :short_list, -> { where(firstname: 'Sam') }


def update_slot_assigned_with_count(param)
  u = User.find(param)
  user_count = User.connection.select_all("SELECT * FROM users WHERE slot_id = #{u.slot_id}").count
  s = Slot.find(u.slot_id)
  s.assigned = user_count
  s.save
 
 # slot.assigned = User.where('slot_id == slot_id',"#{param}").count
  # The .where() method should be finding all rows containing the same value for "assigned"
  #    as passed by the form. It should then get the record count which becomes the
  #    value of slot.assigned
  # code below are some things tried out. 
  
	#binding.pry
  #slot.assigned = User.where('slot_id == slot_id',"#{param}").count
 
end  

  #sluggable_column :email

  def admin?
  	self.role == 'admin'
  end

  def moderator?
  	self.role == 'moderator'
  end

end