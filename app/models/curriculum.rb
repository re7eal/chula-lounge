class Curriculum < ActiveRecord::Base
	belongs_to :faculty
	has_and_belongs_to_many :courses

	
end
