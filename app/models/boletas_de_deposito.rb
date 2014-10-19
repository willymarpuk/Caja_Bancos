class BoletasDeDeposito < ActiveRecord::Base
	has_many :DetallesBoletaDeDepositos
	belongs_to :Persona
	belongs_to :CuentasBancaria
	belongs_to :Banco
	belongs_to :Caja
end
