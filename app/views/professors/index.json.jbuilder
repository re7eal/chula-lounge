json.array!(@professors) do |professor|
  json.extract! professor, :name, :last_name
  json.url professor_url(professor, format: :json)
end
