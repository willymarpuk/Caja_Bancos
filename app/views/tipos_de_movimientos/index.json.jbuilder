json.array!(@tipos_de_movimientos) do |tipos_de_movimiento|
  json.extract! tipos_de_movimiento, :id, :descripcion, :tipo
  json.url tipos_de_movimiento_url(tipos_de_movimiento, format: :json)
end
