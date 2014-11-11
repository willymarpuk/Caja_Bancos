class MovimientosDeBanco < ActiveRecord::Base
	belongs_to :Banco
	belongs_to :TiposDeMovimiento

	# Validaciones

	validates :id_tipo_de_movimiento,
		:presence => {
			message: 'este campo es requerido'},

		:format => {
			with: /\A[0-9]+\z/,
			message: 'solo permite numeros'}

	validates :id_banco,
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

	validates :descripcion,
		:presence => {
			message: 'este campo es requerido'},

		:length => { 
			:maximum => 20,
			:too_long => 'debe tener como maximo %{count} caracteres'},

		:format => {
			with: /\A[a-zA-Z]+\z/,
			message: 'solo permite letras'}

	validates :monto,
		:presence => {
			message: 'este campo es requerido'},

		:format => {
			with: /\A[0-9]+\z/,
			message: 'solo permite numeros'}
end
