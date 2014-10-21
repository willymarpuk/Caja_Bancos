class CreateMovimientosDeCajas < ActiveRecord::Migration
  def change
    create_table :movimientos_de_cajas do |t|
      t.integer :id_tipo_de_movimiento
      t.integer :id_caja
      t.integer :id_cheque_entrante
      t.integer :id_cheque_emitido
      t.string :descripcion
      t.float :monto_efectivo
      t.float :monto_cheque

      t.timestamps
    end
  end
end
