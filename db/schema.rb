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

ActiveRecord::Schema.define(:version => 20110225034160) do

  create_table "assets", :force => true do |t|
    t.string   "name",               :null => false
    t.string   "img_swatch"
    t.string   "img_full"
    t.string   "img_thumb"
    t.string   "img_zoom"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "colors", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "name",                                                         :null => false
    t.string   "code",                                                         :null => false
    t.decimal  "listPrice",   :precision => 8, :scale => 2
    t.decimal  "price",       :precision => 8, :scale => 2,                    :null => false
    t.decimal  "costPrice",   :precision => 8, :scale => 2
    t.boolean  "is_active",                                 :default => false
    t.boolean  "is_promo",                                  :default => false
    t.boolean  "is_new",                                    :default => false
    t.string   "sizeType",                                                     :null => false
    t.string   "description"
    t.string   "composition"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

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
