class CreateBoletasDeDepositos < ActiveRecord::Migration
  def change
    create_table :boletas_de_depositos do |t|
      t.integer :id_banco
      t.integer :id_persona
      t.integer :id_cuenta_bancaria
      t.integer :id_caja
      t.date :fecha

      t.timestamps
    end
  end
end
