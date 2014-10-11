json.array!(@cuentas_corrientes_venta) do |cuentas_corrientes_ventum|
  json.extract! cuentas_corrientes_ventum, :id, :id_persona, :id_caja, :id_movimiento_de_caja, :monto
  json.url cuentas_corrientes_ventum_url(cuentas_corrientes_ventum, format: :json)
end
