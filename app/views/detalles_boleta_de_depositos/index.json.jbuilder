json.array!(@detalles_boleta_de_depositos) do |detalles_boleta_de_deposito|
  json.extract! detalles_boleta_de_deposito, :id, :id_boleta_de_deposito, :efectivo, :monto
  json.url detalles_boleta_de_deposito_url(detalles_boleta_de_deposito, format: :json)
end
