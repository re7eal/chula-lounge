class HaveCourse < ActiveRecord::Base
  belongs_to :trade

   def self.search(search)
    if search
      where('course_number LIKE ? OR course_name LIKE ?', "%#{search}%", "%#{search}%")
    else
      all
    end
  end

end
