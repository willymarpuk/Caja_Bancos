class AddColumnToChequeEmitido < ActiveRecord::Migration
  def change
  	add_column :cheques_emitidos, :nro_cuenta, :integer
  end
end
