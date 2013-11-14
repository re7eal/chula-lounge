class Rating < ActiveRecord::Base
	belongs_to :user
	belongs_to :course

	validates_associated :user, :course
	
	validates :know_rating, length: {minimum: 1}, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 10}, allow_blank: false
	validates :diff_rating, length: {minimum: 1}, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 10}, allow_blank: false
	validates :grade_rating, length: {minimum: 1}, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 10}, allow_blank: false
	validates :user, length: {minimum: 1} ,allow_blank: false
	validates :course, length: {is: 7}, numericality: {only_integer: true}, allow_blank: false
	
end