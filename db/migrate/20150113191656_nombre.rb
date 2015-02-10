class Nombre < ActiveRecord::Migration
  def up
  	change_table :tipos_de_movimientos do |t|
  		t.change :descripcion, :string
  	end
  end

  def down
  	change_table :tipos_de_movimientos do |t|
  		t.change :descripcion, :integer 
	end
  end
end