class ChequesEmitido < ActiveRecord::Base
	has_many :MovimientosDeCajas
	has_many :DetallesCajas
	belongs_to :CuentasBancaria
	belongs_to :Banco
end
