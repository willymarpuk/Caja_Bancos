json.array!(@tipos_de_estados) do |tipos_de_estado|
  json.extract! tipos_de_estado, :id, :descripcion
  json.url tipos_de_estado_url(tipos_de_estado, format: :json)
end
