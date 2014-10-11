json.array!(@detalles_cajas) do |detalles_caja|
  json.extract! detalles_caja, :id, :id_caja, :id_cheque_emitido, :id_cheque_entrante, :monto
  json.url detalles_caja_url(detalles_caja, format: :json)
end
