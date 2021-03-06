class Student < ActiveRecord::Base
	validates :id, uniqueness: true
	validates :user_id, uniqueness: true
	has_and_belongs_to_many :courses

	def admin?
		return (this.role == "admin")? true : false
	end
end
