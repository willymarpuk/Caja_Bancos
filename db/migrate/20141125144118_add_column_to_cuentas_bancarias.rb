class AddColumnToCuentasBancarias < ActiveRecord::Migration
  def change
  	add_column :cuentas_bancaria, :nro_cuenta, :integer
  end
end
