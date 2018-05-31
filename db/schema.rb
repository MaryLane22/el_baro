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

ActiveRecord::Schema.define(version: 20180531181211) do

  create_table "card_payments", force: :cascade do |t|
    t.string   "nombre_propietario"
    t.string   "nombre_banco"
    t.string   "numero_tarjeta"
    t.datetime "fecha_vencimiento"
    t.integer  "codigo"
    t.integer  "monto"
  end

  create_table "card_transactions", force: :cascade do |t|
    t.datetime "crated_at"
    t.string   "nombre_propietario"
    t.string   "nombre_banco"
    t.string   "numero_tarjeta"
    t.datetime "fecha_vencimiento"
    t.integer  "codigo"
    t.float    "monto"
    t.float    "total"
    t.integer  "user_id"
  end

  create_table "oxxo_payments", force: :cascade do |t|
    t.integer  "codigo_emitido"
    t.integer  "codigo_recibido"
    t.datetime "fecha_vencimiento"
    t.integer  "monto"
  end

  create_table "oxxo_transactions", force: :cascade do |t|
    t.datetime "created_at"
    t.integer  "codigo_emitido"
    t.integer  "codigo_recibido"
    t.datetime "fecha_vencimiento"
    t.float    "monto"
    t.float    "total"
    t.integer  "user_id"
    t.integer  "status"
  end

  create_table "purchase_details", force: :cascade do |t|
    t.integer "purchase_id"
    t.integer "service_id"
    t.integer "cantidad"
  end

  create_table "purchase_services", force: :cascade do |t|
    t.integer "purchase_id"
    t.integer "service_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.datetime "created_at"
    t.integer  "total"
    t.integer  "user_id"
  end

  create_table "services", force: :cascade do |t|
    t.string  "nombre"
    t.string  "descripcion"
    t.integer "precio"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "nocontrol"
    t.integer  "saldo"
    t.string   "forma_pago"
    t.datetime "fecha_transaccion"
  end

  create_table "users", force: :cascade do |t|
    t.integer "nocontrol"
    t.string  "nombre"
    t.string  "usuario"
    t.string  "password_digest"
    t.string  "carrera"
    t.integer "semestre"
    t.float   "cant_baros"
  end

end
