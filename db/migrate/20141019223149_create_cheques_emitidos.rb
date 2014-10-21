class CreateChequesEmitidos < ActiveRecord::Migration
  def change
    create_table :cheques_emitidos do |t|
      t.integer :id_cuenta_bancaria
      t.integer :id_banco
      t.date :fecha
      t.string :concepto
      t.float :monto

      t.timestamps
    end
  end
end
