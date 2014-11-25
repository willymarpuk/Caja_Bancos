json.array!(@firmantes) do |firmante|
  json.extract! firmante, :id, :nombre
  json.url firmante_url(firmante, format: :json)
end
