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

ActiveRecord::Schema.define(version: 20160901121746) do

  create_table "alumnos", force: :cascade do |t|
    t.string   "nombre"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "telefono"
    t.string   "genero"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "category_cursos", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.integer  "curso_id"
  end

  add_index "category_cursos", ["category_id"], name: "index_category_cursos_on_category_id"
  add_index "category_cursos", ["curso_id"], name: "index_category_cursos_on_curso_id"

  create_table "curso_alumnos", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "curso_id"
    t.integer  "alumno_id"
  end

  add_index "curso_alumnos", ["alumno_id"], name: "index_curso_alumnos_on_alumno_id"
  add_index "curso_alumnos", ["curso_id"], name: "index_curso_alumnos_on_curso_id"

  create_table "cursos", force: :cascade do |t|
    t.string   "titulo"
    t.date     "fecha"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "lugar"
    t.text     "descripcion"
    t.string   "estado",        default: "cerrado"
    t.datetime "key_timestamp"
    t.date     "fecha_cierre"
  end

  add_index "cursos", ["estado"], name: "index_cursos_on_estado"

  create_table "users", force: :cascade do |t|
    t.string   "crypted_password",          limit: 40
    t.string   "salt",                      limit: 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "name"
    t.string   "email_address"
    t.boolean  "administrator",                        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",                                default: "active"
    t.datetime "key_timestamp"
  end

  add_index "users", ["state"], name: "index_users_on_state"

end
