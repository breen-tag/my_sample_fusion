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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131115160208) do

  create_table "bubble_connectors", :force => true do |t|
    t.integer  "graph_bubble_id"
    t.integer  "graph_connector_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "graph_bubbles", :force => true do |t|
    t.float    "x"
    t.float    "y"
    t.string   "name"
    t.integer  "radius"
    t.string   "shape"
    t.string   "color"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "graph_connectors", :force => true do |t|
    t.integer  "from"
    t.integer  "to"
    t.string   "color"
    t.integer  "strength"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
