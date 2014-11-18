class AddColumnsToBank < ActiveRecord::Migration
  def change
  	add_column :bancos, :sucursal, :string
  	add_column :bancos, :direccion, :string
  	add_column :bancos, :telefono, :integer
  	add_column :bancos, :correo, :string
  end
end
