class CreateTiposDeMovimientos < ActiveRecord::Migration
  def change
    create_table :tipos_de_movimientos do |t|
      t.integer :descripcion
      t.integer :tipo

      t.timestamps
    end
  end
end
