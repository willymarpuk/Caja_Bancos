class CreateDetallesCajas < ActiveRecord::Migration
  def change
    create_table :detalles_cajas do |t|
      t.integer :id_caja
      t.integer :id_cheque_emitido
      t.integer :id_cheque_entrante
      t.float :monto
      t.integer :item

      t.timestamps
    end
  end
end
