class Banco < ActiveRecord::Base
	has_many :BoletasDeDepositos
	has_many :ChequesEntrantes
	has_many :CuentasBancarias
	has_many :ChequesEmitidos
	has_many :MovimientosDeBancos
end
