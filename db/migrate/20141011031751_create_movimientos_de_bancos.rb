class CreateMovimientosDeBancos < ActiveRecord::Migration
  def change
    create_table :movimientos_de_bancos do |t|
      t.integer :id_tipo_de_movimiento
      t.integer :id_banco
      t.integer :id_cuenta_bancaria
      t.string :descripcion
      t.float :monto

      t.timestamps
    end
  end
end
