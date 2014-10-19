# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141011034822) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bancos", force: true do |t|
    t.string   "nombre_banco"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "boletas_de_depositos", force: true do |t|
    t.integer  "id_banco"
    t.integer  "id_persona"
    t.integer  "id_cuenta_bancaria"
    t.integer  "id_caja"
    t.integer  "id_cheque_entrante"
    t.date     "fecha"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cajas", force: true do |t|
    t.integer  "id_estado"
    t.integer  "id_persona"
    t.date     "apertura"
    t.date     "cierre"
    t.float    "saldo_inicial_efectivo"
    t.float    "saldo_final_efectivo"
    t.float    "saldo_inicial_cheque"
    t.float    "saldo_final_cheque"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cheques_emitidos", force: true do |t|
    t.integer  "id_cuenta_bancaria"
    t.integer  "id_banco"
    t.date     "fecha"
    t.string   "concepto"
    t.float    "monto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cheques_entrantes", force: true do |t|
    t.integer  "id_banco"
    t.integer  "numero"
    t.float    "monto"
    t.string   "concepto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cuentas_bancaria", force: true do |t|
    t.integer  "id_banco"
    t.date     "fecha_de_apertura"
    t.float    "saldo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cuentas_corrientes_venta", force: true do |t|
    t.integer  "id_persona"
    t.integer  "id_caja"
    t.integer  "id_movimiento_de_caja"
    t.float    "monto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "detalles_boleta_de_depositos", force: true do |t|
    t.integer  "id_boleta_de_deposito"
    t.float    "efectivo"
    t.float    "monto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "detalles_cajas", force: true do |t|
    t.integer  "id_caja"
    t.integer  "id_cheque_emitido"
    t.integer  "id_cheque_entrante"
    t.float    "monto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movimientos_de_bancos", force: true do |t|
    t.integer  "id_tipo_de_movimiento"
    t.integer  "id_banco"
    t.integer  "id_cuenta_bancaria"
    t.string   "descripcion"
    t.float    "monto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movimientos_de_cajas", force: true do |t|
    t.integer  "id_tipo_de_movimiento"
    t.integer  "id_caja"
    t.integer  "id_cheque_entrante"
    t.integer  "id_cheque_emitido"
    t.string   "descripcion"
    t.float    "monto_efectivo"
    t.float    "monto_cheque"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "personas", force: true do |t|
    t.integer  "id_tipo_de_persona"
    t.string   "nombre"
    t.string   "direccion"
    t.integer  "telefono"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipos_de_estados", force: true do |t|
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipos_de_movimientos", force: true do |t|
    t.integer  "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipos_de_personas", force: true do |t|
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
