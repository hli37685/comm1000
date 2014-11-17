class User < ActiveRecord::Base
#include Sluggable

belongs_to :slot
belongs_to :instructor


has_secure_password validations: false

validates :email, presence: true, uniqueness: true
validates :password, presence: true, on: :create, length: {minimum: 5}

def update_slot_row_count(param)
	#slot.assigned = User.where('slot_id == slot_id',"#{param}").count
	#slot.assigned = params[:assigned]
	#slot.save
end  

  #sluggable_column :email

  def admin?
  	self.role == 'admin'
  end

  def moderator?
  	self.role == 'moderator'
  end

end