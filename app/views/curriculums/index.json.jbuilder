json.array!(@curriculums) do |curriculum|
  json.extract! curriculum, :name, :abbreviation
  json.url curriculum_url(curriculum, format: :json)
end
