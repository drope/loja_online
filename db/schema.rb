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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110502015043) do

  create_table "assets", :force => true do |t|
    t.string   "name",               :null => false
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "bairros", :force => true do |t|
    t.integer  "cidade_id"
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.boolean  "is_active"
  end

  add_index "categories", ["is_active"], :name => "index_categories_on_is_active"

  create_table "cidades", :force => true do |t|
    t.integer  "uf_id"
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cidades", ["uf_id"], :name => "index_cidades_on_uf_id"

  create_table "colors", :force => true do |t|
    t.string   "name",                :null => false
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "swatch_file_name"
    t.string   "swatch_content_type"
    t.integer  "swatch_file_size"
    t.datetime "swatch_updated_at"
  end

  create_table "logradouros", :force => true do |t|
    t.integer  "bairro_id"
    t.integer  "tipo_logradouro_id"
    t.string   "nome"
    t.integer  "cep"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "logradouros", ["cep"], :name => "index_logradouros_on_cep"

  create_table "order_histories", :force => true do |t|
    t.integer  "order_id",        :null => false
    t.integer  "order_status_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "order_histories", ["order_id"], :name => "index_order_histories_on_order_id"

  create_table "order_items", :force => true do |t|
    t.integer  "order_id",                                   :null => false
    t.integer  "variation_id",                               :null => false
    t.decimal  "price",        :precision => 8, :scale => 2, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "qtd"
  end

  add_index "order_items", ["order_id"], :name => "index_order_items_on_order_id"

  create_table "order_ship_addresses", :force => true do |t|
    t.integer  "order_id",    :null => false
    t.string   "cep"
    t.string   "endereco"
    t.string   "numero"
    t.string   "complemento"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "estado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "order_ship_addresses", ["order_id"], :name => "index_order_ship_addresses_on_order_id"

  create_table "order_statuses", :force => true do |t|
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.integer  "number",                                          :null => false
    t.integer  "user_id",                                         :null => false
    t.decimal  "totalItems",        :precision => 8, :scale => 2, :null => false
    t.decimal  "totalShipping",     :precision => 8, :scale => 2, :null => false
    t.decimal  "totalOrder",        :precision => 8, :scale => 2, :null => false
    t.string   "postal_tracking"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "shipping_type"
    t.string   "shipping_estimate"
    t.string   "payment_type"
    t.integer  "order_status_id"
  end

  add_index "orders", ["number"], :name => "index_orders_on_number"
  add_index "orders", ["user_id"], :name => "index_orders_on_user_id"

  create_table "pre_order_items", :force => true do |t|
    t.integer  "pre_order_id",                               :null => false
    t.integer  "variation_id",                               :null => false
    t.decimal  "price",        :precision => 8, :scale => 2, :null => false
    t.integer  "qtd",                                        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pre_order_items", ["pre_order_id"], :name => "index_pre_order_items_on_pre_order_id"

  create_table "pre_orders", :force => true do |t|
    t.integer  "user_id",                                  :null => false
    t.integer  "status",                                   :null => false
    t.decimal  "total",      :precision => 8, :scale => 2, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pre_orders", ["user_id", "status"], :name => "index_pre_orders_on_user_id_and_status"

  create_table "products", :force => true do |t|
    t.string   "name",                                                                          :null => false
    t.string   "code",                                                                          :null => false
    t.decimal  "listPrice",                    :precision => 8, :scale => 2
    t.decimal  "price",                        :precision => 8, :scale => 2,                    :null => false
    t.decimal  "costPrice",                    :precision => 8, :scale => 2
    t.boolean  "is_active",                                                  :default => false
    t.boolean  "is_promo",                                                   :default => false
    t.boolean  "is_new",                                                     :default => false
    t.string   "sizeType",                                                                      :null => false
    t.string   "description"
    t.string   "composition"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "highlight_file_name"
    t.string   "highlight_content_type"
    t.integer  "highlight_file_size"
    t.datetime "highlight_updated_at"
    t.string   "highlight_thumb_file_name"
    t.string   "highlight_thumb_content_type"
    t.integer  "highlight_thumb_file_size"
    t.datetime "highlight_thumb_updated_at"
    t.boolean  "is_highlight"
    t.string   "highlight_bg"
  end

  create_table "sizes", :force => true do |t|
    t.integer  "product_id"
    t.string   "size"
    t.integer  "sizeBust"
    t.integer  "sizeSleeve"
    t.integer  "sizeWaist"
    t.integer  "sizeHip"
    t.integer  "sizeThigh"
    t.integer  "sizeInseam"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ufs", :force => true do |t|
    t.string   "sigla"
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_addresses", :force => true do |t|
    t.integer  "user_id"
    t.string   "cep"
    t.string   "endereco"
    t.string   "numero"
    t.string   "complemento"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "estado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_addresses", ["user_id"], :name => "index_user_addresses_on_user_id"

  create_table "user_infos", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "cpf"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone_ddd"
    t.string   "phone_number"
  end

  add_index "user_infos", ["user_id"], :name => "index_user_infos_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "variations", :force => true do |t|
    t.integer  "product_id"
    t.integer  "size_id"
    t.integer  "color_id"
    t.integer  "stock"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "variations", ["product_id"], :name => "index_variations_on_product_id"

end
