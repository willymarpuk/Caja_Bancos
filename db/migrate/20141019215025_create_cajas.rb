class CreateCajas < ActiveRecord::Migration
  def change
    create_table :cajas do |t|
      t.integer :id_estado
      t.integer :id_persona
      t.date :apertura
      t.date :cierre
      t.float :saldo_inicial_efectivo
      t.float :saldo_final_efectivo
      t.float :saldo_inicial_cheque
      t.float :saldo_final_cheque

      t.timestamps
    end
  end
end
