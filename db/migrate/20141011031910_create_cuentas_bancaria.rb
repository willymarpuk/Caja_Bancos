class CreateCuentasBancaria < ActiveRecord::Migration
  def change
    create_table :cuentas_bancaria do |t|
      t.integer :id_banco
      t.date :fecha_de_apertura
      t.float :saldo

      t.timestamps
    end
  end
end
