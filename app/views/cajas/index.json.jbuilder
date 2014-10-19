json.array!(@cajas) do |caja|
  json.extract! caja, :id, :id_estado, :id_persona, :apertura, :cierre, :saldo_inicial_efectivo, :saldo_final_efectivo, :saldo_inicial_cheque, :saldo_final_cheque
  json.url caja_url(caja, format: :json)
end
