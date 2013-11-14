json.array!(@faculties) do |faculty|
  json.extract! faculty, :id, :name, :abbreviation
  json.curriculums faculty.curriculums
end
