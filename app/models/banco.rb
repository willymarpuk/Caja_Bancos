class Banco < ActiveRecord::Base
	has_many :BoletasDeDepositos
	has_many :ChequesEntrantes
	has_many :CuentasBancarias
	has_many :ChequesEmitidos
	has_many :MovimientosDeBancos

	include ActiveModel::Validations
    validates_length_of :nombre_banco, :maximum => 10
end
