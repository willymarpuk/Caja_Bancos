json.array!(@boletas_de_depositos) do |boletas_de_deposito|
  json.extract! boletas_de_deposito, :id, :id_banco, :id_persona, :id_cuenta_bancaria, :id_caja, :id_cheque_entrante, :fecha
  json.url boletas_de_deposito_url(boletas_de_deposito, format: :json)
end
