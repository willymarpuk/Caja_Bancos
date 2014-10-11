json.array!(@cuentas_bancaria) do |cuentas_bancarium|
  json.extract! cuentas_bancarium, :id, :id_banco, :fecha_de_apertura, :saldo
  json.url cuentas_bancarium_url(cuentas_bancarium, format: :json)
end
