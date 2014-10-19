class CuentasBancarium < ActiveRecord::Base
	has_one :BoletasDeDeposito
	has_many :ChequesEmitidos
	belongs_to :Banco
end
