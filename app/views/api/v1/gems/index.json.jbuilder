json.array! @gems do |gem|
  json.extract! gem, :name, :description
end