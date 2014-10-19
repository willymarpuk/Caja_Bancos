json.array!(@tipos_de_personas) do |tipos_de_persona|
  json.extract! tipos_de_persona, :id, :descripcion
  json.url tipos_de_persona_url(tipos_de_persona, format: :json)
end
