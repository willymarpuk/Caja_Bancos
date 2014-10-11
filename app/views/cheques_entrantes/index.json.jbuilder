json.array!(@cheques_entrantes) do |cheques_entrante|
  json.extract! cheques_entrante, :id, :id_banco, :numero, :monto, :concepto
  json.url cheques_entrante_url(cheques_entrante, format: :json)
end
