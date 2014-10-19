class CreateTiposDePersonas < ActiveRecord::Migration
  def change
    create_table :tipos_de_personas do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
