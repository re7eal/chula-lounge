class Teach < ActiveRecord::Base

	belongs_to :professor
	belongs_to :course

    accepts_nested_attributes_for :professor
	after_create :professor_id, length: {minimum: 1}, numericality: {only_integer: true}, allow_blank: false
	after_create :course_id,  length: {minimum: 1}, numericality: {only_integer: true}, allow_blank: false
	validates :year,  length: {is: 4}, numericality: {only_integer: true}, allow_blank: false
end
