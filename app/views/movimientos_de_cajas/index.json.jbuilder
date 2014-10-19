json.array!(@movimientos_de_cajas) do |movimientos_de_caja|
  json.extract! movimientos_de_caja, :id, :id_tipo_de_movimiento, :id_caja, :id_cheque_entrante, :id_cheque_emitido, :descripcion, :monto_efectivo, :monto_cheque
  json.url movimientos_de_caja_url(movimientos_de_caja, format: :json)
end
