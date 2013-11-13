json.array!(@courses) do |course|
	json.extract! course, :id, :title, :number
end