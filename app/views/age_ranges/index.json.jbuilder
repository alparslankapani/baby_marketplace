json.array!(@age_ranges) do |age_range|
  json.extract! age_range, :id, :age
  json.url age_range_url(age_range, format: :json)
end
