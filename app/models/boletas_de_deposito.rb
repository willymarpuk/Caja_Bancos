class BoletasDeDeposito < ActiveRecord::Base
	has_many :DetallesBoletaDeDepositos
	belongs_to :Persona
	belongs_to :CuentasBancarium
	belongs_to :Banco
	belongs_to :Caja

	# Validaciones

	validates :id_banco,
		:presence => {
			message: 'este campo es requerido'},

		:format => {
			with: /\A[0-9]+\z/,
			message: 'solo permite numeros'}

	validates :id_persona,
		:presence => {
			message: 'este campo es requerido'},

		:format => {
			with: /\A[0-9]+\z/,
			message: 'solo permite numeros'}

	validates :id_cuenta_bancaria,
		:presence => {
			message: 'este campo es requerido'},

		:format => {
			with: /\A[0-9]+\z/,
			message: 'solo permite numeros'}

	validates :id_caja,
		:presence => {
			message: 'este campo es requerido'},

		:format => {
			with: /\A[0-9]+\z/,
			message: 'solo permite numeros'}

validates :fecha,
		:presence => {
			message: 'este campo es requerido'}

	def name_with_initial
		"#{nro_cuenta}"
	end
end