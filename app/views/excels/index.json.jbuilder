json.array!(@excels) do |excel|
  json.extract! excel, :id, :name, :url
  json.url excel_url(excel, format: :json)
end
