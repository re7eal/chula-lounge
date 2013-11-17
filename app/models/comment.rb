class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :course
	has_many :likes
	has_many :dislikes

	validates_associated :user, :course
	validates :user, :presence => true
	validates :content, length: {minimum: 1} ,allow_blank: false
	validates :user, length: {minimum: 1} ,allow_blank: false
	#validates :course, length: {is: 7}, numericality: {only_integer: true}, allow_blank: false
		
end
