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

ActiveRecord::Schema[7.1].define(version: 2024_11_12_061947) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "equipment", force: :cascade do |t|
    t.string "unit_name", null: false
    t.string "identifier", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "materials", force: :cascade do |t|
    t.integer "matcode"
    t.string "name"
    t.decimal "unit_cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["matcode"], name: "index_materials_on_matcode", unique: true
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "reservation_number"
    t.integer "wor_number", null: false
    t.datetime "issued_at", precision: nil
    t.string "status"
    t.decimal "total_cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reservation_number"], name: "index_reservations_on_reservation_number", unique: true
    t.index ["wor_number"], name: "index_reservations_on_wor_number"
  end

  create_table "reserved_materials", force: :cascade do |t|
    t.bigint "reservation_id", null: false
    t.bigint "material_id", null: false
    t.integer "quantity"
    t.decimal "subtotal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["material_id"], name: "index_reserved_materials_on_material_id"
    t.index ["reservation_id"], name: "index_reserved_materials_on_reservation_id"
  end

  create_table "shortcutusers", force: :cascade do |t|
    t.string "username", null: false
    t.integer "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.integer "role_id", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status", default: true
  end

  create_table "work_orders", force: :cascade do |t|
    t.integer "wor_number", null: false
    t.bigint "equipment_id", null: false
    t.string "priority", null: false
    t.string "description", null: false
    t.string "status", null: false
    t.datetime "inspected_at", precision: nil, null: false
    t.bigint "requestor_id", null: false
    t.datetime "reviewed_at", precision: nil
    t.bigint "reviewer_id"
    t.datetime "approved_at", precision: nil
    t.bigint "approver_id"
    t.datetime "closed_at", precision: nil
    t.bigint "closer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "running_hours"
    t.string "sc_requestor"
    t.string "sc_reviewer"
    t.string "sc_approver"
    t.string "sc_closer"
    t.index ["approver_id"], name: "index_work_orders_on_approver_id"
    t.index ["closer_id"], name: "index_work_orders_on_closer_id"
    t.index ["equipment_id"], name: "index_work_orders_on_equipment_id"
    t.index ["requestor_id"], name: "index_work_orders_on_requestor_id"
    t.index ["reviewer_id"], name: "index_work_orders_on_reviewer_id"
    t.index ["wor_number"], name: "index_work_orders_on_wor_number", unique: true
  end

  add_foreign_key "reservations", "work_orders", column: "wor_number", primary_key: "wor_number", name: "fk_wor_number", on_delete: :cascade
  add_foreign_key "reserved_materials", "materials"
  add_foreign_key "reserved_materials", "reservations"
  add_foreign_key "work_orders", "equipment"
  add_foreign_key "work_orders", "users", column: "approver_id"
  add_foreign_key "work_orders", "users", column: "closer_id"
  add_foreign_key "work_orders", "users", column: "requestor_id"
  add_foreign_key "work_orders", "users", column: "reviewer_id"
end
