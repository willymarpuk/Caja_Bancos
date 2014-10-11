json.array!(@cheques_emitidos) do |cheques_emitido|
  json.extract! cheques_emitido, :id, :id_cuenta_bancaria, :id_banco, :fecha, :concepto, :monto
  json.url cheques_emitido_url(cheques_emitido, format: :json)
end
