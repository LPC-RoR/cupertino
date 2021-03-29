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

ActiveRecord::Schema.define(version: 2021_03_29_224837) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administradores", force: :cascade do |t|
    t.string "administrador"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_administradores_on_email"
  end

  create_table "area_bases", force: :cascade do |t|
    t.integer "orden"
    t.string "area_base"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["orden"], name: "index_area_bases_on_orden"
  end

  create_table "asignatura_bases", force: :cascade do |t|
    t.string "asignatura_base"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "detalle"
    t.integer "curriculum_base_id"
    t.index ["curriculum_base_id"], name: "index_asignatura_bases_on_curriculum_base_id"
  end

  create_table "asignatura_nivel_bases", force: :cascade do |t|
    t.integer "asignatura_base_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "asignatura_nivel_base"
    t.string "origen"
    t.string "tipo"
    t.integer "tipo_asignatura_base_id"
    t.index ["asignatura_base_id"], name: "index_asignatura_nivel_bases_on_asignatura_base_id"
    t.index ["tipo_asignatura_base_id"], name: "index_asignatura_nivel_bases_on_tipo_asignatura_base_id"
  end

  create_table "citas", force: :cascade do |t|
    t.integer "referencia_base_id"
    t.integer "documento_base_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["documento_base_id"], name: "index_citas_on_documento_base_id"
    t.index ["referencia_base_id"], name: "index_citas_on_referencia_base_id"
  end

  create_table "conversaciones", force: :cascade do |t|
    t.integer "parent_id"
    t.integer "child_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id"], name: "index_conversaciones_on_child_id"
    t.index ["parent_id"], name: "index_conversaciones_on_parent_id"
  end

  create_table "curriculum_bases", force: :cascade do |t|
    t.integer "orden"
    t.string "curriculum_base"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["orden"], name: "index_curriculum_bases_on_orden"
  end

  create_table "curriculums", force: :cascade do |t|
    t.integer "nivel_base_id"
    t.integer "asignatura_nivel_base_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asignatura_nivel_base_id"], name: "index_curriculums_on_asignatura_nivel_base_id"
    t.index ["nivel_base_id"], name: "index_curriculums_on_nivel_base_id"
  end

  create_table "documento_bases", force: :cascade do |t|
    t.integer "orden"
    t.string "documento_base"
    t.integer "area_base_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "link"
    t.index ["area_base_id"], name: "index_documento_bases_on_area_base_id"
    t.index ["orden"], name: "index_documento_bases_on_orden"
  end

  create_table "item_bases", force: :cascade do |t|
    t.integer "orden"
    t.string "item_base"
    t.string "pagina"
    t.integer "documento_base_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["documento_base_id"], name: "index_item_bases_on_documento_base_id"
  end

  create_table "mejoras", force: :cascade do |t|
    t.string "mejora"
    t.text "detalle"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_mejoras_on_owner_id"
  end

  create_table "mensajes", force: :cascade do |t|
    t.string "mensaje"
    t.string "tipo"
    t.string "estado"
    t.string "email"
    t.datetime "fecha_envio"
    t.text "detalle"
    t.integer "perfil_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_mensajes_on_email"
    t.index ["estado"], name: "index_mensajes_on_estado"
    t.index ["fecha_envio"], name: "index_mensajes_on_fecha_envio"
    t.index ["perfil_id"], name: "index_mensajes_on_perfil_id"
    t.index ["tipo"], name: "index_mensajes_on_tipo"
  end

  create_table "nivel_bases", force: :cascade do |t|
    t.integer "orden"
    t.string "nivel_base"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "primer_nivel"
    t.integer "curriculum_base_id"
    t.index ["curriculum_base_id"], name: "index_nivel_bases_on_curriculum_base_id"
    t.index ["orden"], name: "index_nivel_bases_on_orden"
    t.index ["primer_nivel"], name: "index_nivel_bases_on_primer_nivel"
  end

  create_table "observaciones", force: :cascade do |t|
    t.string "observacion"
    t.text "detalle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pasos", force: :cascade do |t|
    t.integer "orden"
    t.string "paso"
    t.text "detalle"
    t.integer "tutorial_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["orden"], name: "index_pasos_on_orden"
    t.index ["tutorial_id"], name: "index_pasos_on_tutorial_id"
  end

  create_table "perfiles", force: :cascade do |t|
    t.string "email"
    t.integer "administrador_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["administrador_id"], name: "index_perfiles_on_administrador_id"
    t.index ["email"], name: "index_perfiles_on_email"
  end

  create_table "referencia_bases", force: :cascade do |t|
    t.string "referencia_base"
    t.string "tipo_referencia_base_id"
    t.string "seccion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "clave"
    t.index ["clave"], name: "index_referencia_bases_on_clave"
    t.index ["tipo_referencia_base_id"], name: "index_referencia_bases_on_tipo_referencia_base_id"
  end

  create_table "referencias", force: :cascade do |t|
    t.integer "asignatura_nivel_base_id"
    t.integer "asignatura_base_id"
    t.integer "documento_base_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asignatura_base_id"], name: "index_referencias_on_asignatura_base_id"
    t.index ["asignatura_nivel_base_id"], name: "index_referencias_on_asignatura_nivel_base_id"
    t.index ["documento_base_id"], name: "index_referencias_on_documento_base_id"
  end

  create_table "requisitos", force: :cascade do |t|
    t.integer "parent_id"
    t.integer "child_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id"], name: "index_requisitos_on_child_id"
    t.index ["parent_id"], name: "index_requisitos_on_parent_id"
  end

  create_table "tema_ayudas", force: :cascade do |t|
    t.integer "orden"
    t.string "tema_ayuda"
    t.text "detalle"
    t.string "tipo"
    t.string "ilustracion"
    t.string "ilustracion_cache"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["orden"], name: "index_tema_ayudas_on_orden"
    t.index ["tipo"], name: "index_tema_ayudas_on_tipo"
  end

  create_table "tipo_asignatura_bases", force: :cascade do |t|
    t.integer "orden"
    t.string "tipo_asignatura_base"
    t.integer "curriculum_base_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["curriculum_base_id"], name: "index_tipo_asignatura_bases_on_curriculum_base_id"
    t.index ["orden"], name: "index_tipo_asignatura_bases_on_orden"
  end

  create_table "tipo_referencia_bases", force: :cascade do |t|
    t.integer "orden"
    t.string "tipo_referencia_base"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["orden"], name: "index_tipo_referencia_bases_on_orden"
  end

  create_table "tutoriales", force: :cascade do |t|
    t.integer "orden"
    t.string "tutorial"
    t.text "detalle"
    t.integer "tema_ayuda_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["orden"], name: "index_tutoriales_on_orden"
    t.index ["tema_ayuda_id"], name: "index_tutoriales_on_tema_ayuda_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_usuarios_on_confirmation_token", unique: true
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_usuarios_on_unlock_token", unique: true
  end

end
