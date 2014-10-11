json.array!(@bancos) do |banco|
  json.extract! banco, :id, :nombre_banco
  json.url banco_url(banco, format: :json)
end
