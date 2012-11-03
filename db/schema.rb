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

ActiveRecord::Schema.define(:version => 20121103133751) do

  create_table "bloques", :force => true do |t|
    t.string "nombre"
  end

  create_table "comisions", :force => true do |t|
    t.string "nombre"
  end

  create_table "legisladors", :force => true do |t|
    t.string  "apellido"
    t.string  "nombre"
    t.integer "provincia_id"
    t.date    "mandato_inicio"
    t.date    "mandato_fin"
    t.boolean "es_diputado",      :default => true
    t.boolean "es_senador",       :default => false
    t.integer "bloque_actual_id"
    t.string  "key"
    t.boolean "actual",           :default => false
    t.string  "email"
    t.date    "fecha_nacimiento"
  end

  create_table "palabras", :force => true do |t|
    t.integer "legislador_id"
    t.integer "anio"
    t.integer "cantidad"
  end

  create_table "provincias", :force => true do |t|
    t.string "nombre"
  end

end
