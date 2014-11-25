class MovimientosDeCaja < ActiveRecord::Base
	has_many :CuentasCorrientesVentum
	belongs_to :ChequesEntrante
	belongs_to :TiposDeMovimiento
	belongs_to :Caja
	belongs_to :ChequesEmitido

	# Validaciones

	validates :id_tipo_de_movimiento,
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

	validates :id_cheque_entrante,
		:presence => {
			message: 'este campo es requerido'},

		:format => {
			with: /\A[0-9]+\z/,
			message: 'solo permite numeros'}

	validates :id_cheque_emitido,
		:presence => {
			message: 'este campo es requerido'},

		:format => {
			with: /\A[0-9]+\z/,
			message: 'solo permite numeros'}

	validates :descripcion,
		:presence => {
			message: 'este campo es requerido'},

		:length => { 
			:maximum => 20,
			:too_long => 'debe tener como maximo %{count} caracteres'},

		:format => {
			with: /\A[a-zA-Z]+\z/,
			message: 'solo permite letras'}

	validates :monto_efectivo,
		:presence => {
			message: 'este campo es requerido'},

		:format => {
			with: /\A[0-9]+\z/,
			message: 'solo permite numeros'}

	validates :monto_cheque,
		:presence => {
			message: 'este campo es requerido'},

		:format => {
			with: /\A[0-9]+\z/,
			message: 'solo permite numeros'}
end
