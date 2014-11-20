class CreateLogAudits < ActiveRecord::Migration
  def change
    create_table :log_audits do |t|
      t.string :nombre_tabla
      t.string :operacion
      t.string :valor_anterior
      t.string :valor_nuevo
      t.string :nombre_usuario

      t.timestamps
    end
  end
end
