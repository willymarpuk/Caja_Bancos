class CreateChequesEntrantes < ActiveRecord::Migration
  def change
    create_table :cheques_entrantes do |t|
      t.integer :id_banco
      t.integer :numero
      t.float :monto
      t.string :concepto

      t.timestamps
    end
  end
end
