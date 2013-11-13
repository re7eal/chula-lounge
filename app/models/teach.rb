class Teach < ActiveRecord::Base

	belongs_to :professor
	belongs_to :course

	validates :professor_id, length: {minimum: 1}, numericality: {only_integer: true}, allow_blank: false
	validates :course_id,  length: {minimum: 1}, numericality: {only_integer: true}, allow_blank: false
	validates :year,  length: {is: 4}, numericality: {only_integer: true}, allow_blank: false
end
