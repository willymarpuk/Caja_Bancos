class CreateCuentasCorrientesVenta < ActiveRecord::Migration
  def change
    create_table :cuentas_corrientes_venta do |t|
      t.integer :id_persona
      t.integer :id_caja
      t.integer :id_movimiento_de_caja
      t.float :monto

      t.timestamps
    end
  end
end
