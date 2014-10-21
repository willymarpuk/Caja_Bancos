class CreateDetallesBoletaDeDepositos < ActiveRecord::Migration
  def change
    create_table :detalles_boleta_de_depositos do |t|
      t.integer :id_boleta_de_deposito
      t.float :efectivo
      t.float :monto
      t.integer :item
      t.integer :id_cheque_entrante

      t.timestamps
    end
  end
end
