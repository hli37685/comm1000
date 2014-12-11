class Instructor < ActiveRecord::Base

has_many :users

scope :teel, -> { where(id: '3') }

def name_with_email
	"#{name} #{email}"
end

end