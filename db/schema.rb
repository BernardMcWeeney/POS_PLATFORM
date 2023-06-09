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

ActiveRecord::Schema[7.0].define(version: 2023_05_26_130236) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "post_town"
    t.string "county"
    t.string "eircode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "association_memberships", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "association_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["association_id"], name: "index_association_memberships_on_association_id"
    t.index ["user_id", "association_id"], name: "index_association_memberships_on_user_id_and_association_id", unique: true
    t.index ["user_id"], name: "index_association_memberships_on_user_id"
  end

  create_table "associations", force: :cascade do |t|
    t.integer "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_associations_on_group_id"
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "quantity"
    t.decimal "total"
    t.integer "cart_id", null: false
    t.integer "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.string "name"
    t.decimal "price"
    t.string "sku"
    t.decimal "tax", precision: 10, scale: 2, default: "0.0"
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["product_id"], name: "index_cart_items_on_product_id"
  end

  create_table "carts", force: :cascade do |t|
    t.decimal "total"
    t.decimal "tax"
    t.string "status"
    t.integer "user_id", null: false
    t.integer "location_id", null: false
    t.integer "cart_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_carts_on_location_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "group_memberships", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_memberships_on_group_id"
    t.index ["user_id", "group_id"], name: "index_group_memberships_on_user_id_and_group_id", unique: true
    t.index ["user_id"], name: "index_group_memberships_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "address"
    t.string "image"
    t.integer "organisation_id", null: false
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organisation_id"], name: "index_groups_on_organisation_id"
  end

  create_table "location_memberships", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_location_memberships_on_location_id"
    t.index ["user_id"], name: "index_location_memberships_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.integer "group_id", null: false
    t.integer "organisation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_locations_on_group_id"
    t.index ["organisation_id"], name: "index_locations_on_organisation_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "group_id"
    t.integer "organisation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_memberships_on_group_id"
    t.index ["organisation_id"], name: "index_memberships_on_organisation_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "quantity", null: false
    t.decimal "price", precision: 10, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.string "name"
    t.string "sku"
    t.decimal "tax", precision: 10, scale: 2, default: "0.0"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "order_number"
    t.decimal "total_price"
    t.string "status"
    t.integer "location_id", null: false
    t.integer "user_id", null: false
    t.string "payment_method"
    t.string "payment_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_orders_on_location_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "organisation_memberships", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "organisation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organisation_id"], name: "index_organisation_memberships_on_organisation_id"
    t.index ["user_id", "organisation_id"], name: "index_organisation_memberships_on_user_id_and_organisation_id", unique: true
    t.index ["user_id"], name: "index_organisation_memberships_on_user_id"
  end

  create_table "organisations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "owner"
    t.string "image"
    t.text "web_links"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_assignments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "location_id", null: false
    t.integer "product_id", null: false
    t.string "assignment_type"
    t.index ["location_id"], name: "index_product_assignments_on_location_id"
    t.index ["product_id"], name: "index_product_assignments_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.string "group_assignment_type"
    t.boolean "featured"
    t.integer "stocked"
    t.string "sku"
    t.integer "location_id", null: false
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_status"
    t.index ["group_id"], name: "index_products_on_group_id"
    t.index ["location_id"], name: "index_products_on_location_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.integer "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "onboarding_completed", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "association_memberships", "associations"
  add_foreign_key "association_memberships", "users"
  add_foreign_key "associations", "groups"
  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "products"
  add_foreign_key "carts", "locations"
  add_foreign_key "carts", "users"
  add_foreign_key "group_memberships", "groups"
  add_foreign_key "group_memberships", "users"
  add_foreign_key "groups", "organisations"
  add_foreign_key "location_memberships", "locations"
  add_foreign_key "location_memberships", "users"
  add_foreign_key "locations", "groups"
  add_foreign_key "locations", "organisations"
  add_foreign_key "memberships", "groups"
  add_foreign_key "memberships", "organisations"
  add_foreign_key "memberships", "users"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "locations"
  add_foreign_key "orders", "users"
  add_foreign_key "organisation_memberships", "organisations"
  add_foreign_key "organisation_memberships", "users"
  add_foreign_key "product_assignments", "locations"
  add_foreign_key "product_assignments", "products"
  add_foreign_key "products", "groups"
  add_foreign_key "products", "locations"
end
