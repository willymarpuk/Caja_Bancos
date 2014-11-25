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

ActiveRecord::Schema.define(version: 20141125144337) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bancos", force: true do |t|
    t.string   "nombre_banco"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sucursal"
    t.string   "direccion"
    t.integer  "telefono"
    t.string   "correo"
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
    t.integer  "nro_cuenta"
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
    t.integer  "id_firmante"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "nro_cuenta"
  end

  create_table "cuentas_corrientes_venta", force: true do |t|
    t.integer  "id_persona"
    t.integer  "id_caja"
    t.integer  "id_movimiento_de_caja"
    t.float    "monto"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "nro_cuenta"
  end

  create_table "detalles_boleta_de_depositos", force: true do |t|
    t.integer  "id_boleta_de_deposito"
    t.float    "efectivo"
    t.float    "monto"
    t.integer  "item"
    t.integer  "id_cheque_entrante"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "detalles_cajas", force: true do |t|
    t.integer  "id_caja"
    t.integer  "id_cheque_emitido"
    t.integer  "id_cheque_entrante"
    t.float    "monto"
    t.integer  "item"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "firmantes", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "log_audits", force: true do |t|
    t.string   "nombre_tabla"
    t.string   "operacion"
    t.string   "valor_anterior"
    t.string   "valor_nuevo"
    t.string   "nombre_usuario"
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
    t.string   "localidad"
    t.string   "departamento"
    t.integer  "telefono"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "tipos_de_estados", force: true do |t|
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipos_de_movimientos", force: true do |t|
    t.integer  "descripcion"
    t.integer  "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipos_de_personas", force: true do |t|
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
