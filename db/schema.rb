# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_18_130828) do

  create_table "bancos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clientes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nombre"
    t.string "dni"
    t.string "password"
    t.decimal "nomina", precision: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cuenta", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "iban"
    t.decimal "saldo", precision: 10
    t.bigint "cliente_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cliente_id"], name: "index_cuenta_on_cliente_id"
  end

  create_table "developers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_developers_on_project_id"
  end

  create_table "inversions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.decimal "cantidad", precision: 10
    t.integer "meses"
    t.decimal "interes", precision: 10
    t.bigint "cuenta_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cuenta_id"], name: "index_inversions_on_cuenta_id"
  end

  create_table "movimientos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.decimal "cantidad", precision: 10
    t.bigint "cuenta_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cuenta_id"], name: "index_movimientos_on_cuenta_id"
  end

  create_table "prestamos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.decimal "cantidad", precision: 10
    t.integer "cuotas"
    t.decimal "interes", precision: 10
    t.bigint "cuenta_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cuenta_id"], name: "index_prestamos_on_cuenta_id"
  end

  create_table "projects", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.integer "team"
    t.text "info"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "requests", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "tipo"
    t.integer "id_objetivo"
    t.bigint "cliente_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cliente_id"], name: "index_requests_on_cliente_id"
  end

  create_table "tarjeta", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "num_tarjeta"
    t.bigint "cuenta_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cuenta_id"], name: "index_tarjeta_on_cuenta_id"
  end

  create_table "transfers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.decimal "cantidad", precision: 10
    t.bigint "cuenta_id", null: false
    t.integer "cuenta_destino"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cuenta_id"], name: "index_transfers_on_cuenta_id"
  end

  add_foreign_key "cuenta", "clientes"
  add_foreign_key "developers", "projects"
  add_foreign_key "inversions", "cuenta", column: "cuenta_id"
  add_foreign_key "movimientos", "cuenta", column: "cuenta_id"
  add_foreign_key "prestamos", "cuenta", column: "cuenta_id"
  add_foreign_key "requests", "clientes"
  add_foreign_key "tarjeta", "cuenta", column: "cuenta_id"
  add_foreign_key "transfers", "cuenta", column: "cuenta_id"
end
