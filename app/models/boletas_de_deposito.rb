class BoletasDeDeposito < ActiveRecord::Base
	has_many :DetallesBoletaDeDepositos
	belongs_to :Persona
	belongs_to :CuentasBancaria
	belongs_to :Banco
	belongs_to :Caja

	# Validaciones

	validates :id_banco,
		:presence => {
			message: 'este campo es requerido'},

		:format => {
			with: /\A[0-9]+\z/,
			message: 'solo permite numeros'}

	validates :numero,
		:presence => {
			message: 'este campo es requerido'},

		:format => {
			with: /\A[0-9]+\z/,
			message: 'solo permite numeros'}

	validates :monto,
		:presence => {
			message: 'este campo es requerido'},

		:format => {
			with: /\A[0-9]+\z/,
			message: 'solo permite numeros'}

	validates :concepto,
		:presence => {
			message: 'este campo es requerido'},

		:format => {
			with: /\A[a-zA-Z]+\z/,
			message: 'solo permite letras'}
end