json.array!(@personas) do |persona|
  json.extract! persona, :id, :id_tipo_de_persona, :nombre, :direccion, :localidad, :departamento, :telefono
  json.url persona_url(persona, format: :json)
end
