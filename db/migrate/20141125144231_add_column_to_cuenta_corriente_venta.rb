class AddColumnToCuentaCorrienteVenta < ActiveRecord::Migration
  def change
  	add_column :cuentas_corrientes_venta, :nro_cuenta, :integer
  end
end
