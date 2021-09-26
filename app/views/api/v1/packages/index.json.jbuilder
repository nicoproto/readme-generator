json.array! @packages do |package|
  json.extract! package, :name, :description
end