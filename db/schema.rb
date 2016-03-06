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

ActiveRecord::Schema.define(version: 20160306021631) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "health_cares", force: :cascade do |t|
    t.string   "origin_id"
    t.integer  "locale_id"
    t.date     "data_atendimento"
    t.string   "codigo_tipo_atendimento"
    t.string   "descricao_tipo_atendimento"
    t.string   "codigo_grupo_gtendimento_sus"
    t.string   "descricao_grupo_atendimento"
    t.integer  "ocupacao_profissional"
    t.string   "descricao_tipo_vinculo_sms"
    t.string   "codigo_procedimento_sus"
    t.string   "descricao_procedimento"
    t.string   "codigo_atividade_profissional_sus"
    t.string   "descricao_atividade_profissional"
    t.string   "sexo"
    t.string   "idade"
    t.string   "hora"
    t.string   "periodo"
    t.string   "data_nascimento"
    t.integer  "quantidade_realizada"
    t.datetime "hora_atendimento"
    t.datetime "hora_saida_local"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "health_cares", ["codigo_procedimento_sus"], name: "index_health_cares_on_codigo_procedimento_sus", using: :btree
  add_index "health_cares", ["data_atendimento"], name: "index_health_cares_on_data_atendimento", using: :btree
  add_index "health_cares", ["descricao_procedimento"], name: "index_health_cares_on_descricao_procedimento", using: :btree
  add_index "health_cares", ["locale_id"], name: "index_health_cares_on_locale_id", using: :btree
  add_index "health_cares", ["origin_id"], name: "index_health_cares_on_origin_id", using: :btree

  create_table "locales", force: :cascade do |t|
    t.string   "distrito_vinculo"
    t.string   "local_atendimento"
    t.string   "distrito_atendimento"
    t.float    "lat"
    t.float    "lng"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "capacidade_atendimento"
  end

  add_foreign_key "health_cares", "locales"
end
