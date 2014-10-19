json.array!(@movimientos_de_bancos) do |movimientos_de_banco|
  json.extract! movimientos_de_banco, :id, :id_tipo_de_movimiento, :id_banco, :id_cuenta_bancaria, :descripcion, :monto
  json.url movimientos_de_banco_url(movimientos_de_banco, format: :json)
end
