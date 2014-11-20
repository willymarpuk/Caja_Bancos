json.array!(@log_audits) do |log_audit|
  json.extract! log_audit, :id, :nombre_tabla, :operacion, :valor_anterior, :valor_nuevo, :nombre_usuario
  json.url log_audit_url(log_audit, format: :json)
end
