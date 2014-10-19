class ChequesEntrante < ActiveRecord::Base
	has_many :DetallesBoletaDeDepositos
	has_many :detallesCajas
	has_many :MovimientosDeCajas
	belongs_to :Banco
end
