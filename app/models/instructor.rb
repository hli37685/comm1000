class Instructor < ActiveRecord::Base

has_many :users

def name_with_email
	"#{name} #{email}"
end

end