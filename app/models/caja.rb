class Caja < ActiveRecord::Base
	has_many :BoletasDeDeposito
	has_many :MovimientosDeCajas
	has_many :CuentasCorrientesVentum
	has_many :DetallesCajas
	belongs_to :Persona
	belongs_to :TiposDeEstado

	# Validaciones

	validates :id_estado,
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

	validates :apertura,
		:presence => {
			message: 'este campo es requerido'}

	validates :cierre,
		:presence => {
			message: 'este campo es requerido'}

	validates :saldo_inicial_cheque,
		:presence => {
			message: 'este campo es requerido'},

		:format => {
			with: /\A[0-9]+\z/,
			message: 'solo permite numeros'}

	validates :saldo_final_cheque,
		:presence => {
			message: 'este campo es requerido'},

		:format => {
			with: /\A[0-9]+\z/,
			message: 'solo permite numeros'}

	validates :saldo_inicial_efectivo,
		:presence => {
			message: 'este campo es requerido'},

		:format => {
			with: /\A[0-9]+\z/,
			message: 'solo permite numeros'}

	validates :saldo_final_efectivo,
		:presence => {
			message: 'este campo es requerido'},

		:format => {
			with: /\A[0-9]+\z/,
			message: 'solo permite numeros'}
end