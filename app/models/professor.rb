class Professor < ActiveRecord::Base
	has_many :teaches
	has_many :courses ,through: :teaches
	accepts_nested_attributes_for :teaches

	validates_associated :teaches

	validates :name, length: {minimum: 1} ,allow_blank: false
	validates :last_name, length: {minimum: 1} ,allow_blank: false


end
