class Course < ActiveRecord::Base
	has_and_belongs_to_many :curriculums
	has_many :comments
	has_many :ratings
	has_many :teaches
	has_many :professors , through: :teaches

	def self.autocomplete faculty,query
	  Course.joins(:curriculums => :faculty).where("(LOWER(courses.title) LIKE ? OR courses.number LIKE ?) AND faculties.id = ?",
      "#{query}%", "#{query}%", "#{faculty}")
    end
    def self.by_curriculum query
      all(
      	:conditions => [
      	"curriculums.id LIKE ? AND courses.year"
      	]
      	)
    end
    accepts_nested_attributes_for :curriculums
    accepts_nested_attributes_for :teaches
    accepts_nested_attributes_for :professors


#    validates :teaches, :presence => true
 #   validates :curriculums, :presence => true
    validates :title, length: {minimum: 1} ,allow_blank: false
    validates :number, length: {is: 7}, numericality: {only_integer: true}, allow_blank: false
    validates :description, length: {minimum: 1} ,allow_blank: false
    validates :year, length: {is: 1}, numericality: {only_integer: true}, allow_blank: false
end
