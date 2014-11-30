class CuentasBancarium < ActiveRecord::Base
	has_one :BoletasDeDeposito
	has_many :ChequesEmitidos
	belongs_to :Banco
	belongs_to :firmante

	# Validaciones

	validates :id_banco,
		:presence => {
			message: 'este campo es requerido'},

		:format => {
			with: /\A[0-9]+\z/,
			message: 'solo permite numeros'}

	validates :id_firmante,
		:presence => {
			message: 'este campo es requerido'},

		:format => {
			with: /\A[0-9]+\z/,
			message: 'solo permite numeros'}

	validates :saldo,
		:presence => {
			message: 'este campo es requerido'},

		:format => {
			with: /\A[0-9]+\z/,
			message: 'solo permite numeros'}

	validates :fecha_de_apertura,
		:presence => {
			message: 'este campo es requerido'}

	def name_with_initial
		"#{nro_cuenta}"
	end
end
