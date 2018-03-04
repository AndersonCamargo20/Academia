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

ActiveRecord::Schema.define(version: 201711251810336) do

  create_table "alunos", force: :cascade do |t|
    t.integer "pessoa_id"
    t.boolean "ativo"
    t.string "matricula"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pessoa_id"], name: "index_alunos_on_pessoa_id"
  end

  create_table "cargos", force: :cascade do |t|
    t.string "descricaoCargo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contas_pagars", force: :cascade do |t|
    t.string "descricao"
    t.float "valor"
    t.date "data_pagamento"
    t.boolean "pago"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "fornecedor_id"
    t.index ["fornecedor_id"], name: "index_contas_pagars_on_fornecedor_id"
  end

  create_table "contas_recebers", force: :cascade do |t|
    t.integer "aluno_id"
    t.date "data_recebimento"
    t.boolean "pago"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "valor"
    t.index ["aluno_id"], name: "index_contas_recebers_on_aluno_id"
  end

  create_table "exame_fisicos", force: :cascade do |t|
    t.integer "aluno_id"
    t.integer "funcionario_id"
    t.date "dataExame"
    t.float "peso"
    t.float "altura"
    t.float "imc"
    t.float "busto"
    t.float "cintura"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aluno_id"], name: "index_exame_fisicos_on_aluno_id"
    t.index ["funcionario_id"], name: "index_exame_fisicos_on_funcionario_id"
  end

  create_table "fornecedors", force: :cascade do |t|
    t.string "nome"
    t.string "cidade"
    t.string "bairro"
    t.string "rua"
    t.boolean "ativo"
    t.string "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "funcionarios", force: :cascade do |t|
    t.integer "pessoa_id"
    t.integer "cargo_id"
    t.float "salario"
    t.date "dataContratacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cargo_id"], name: "index_funcionarios_on_cargo_id"
    t.index ["pessoa_id"], name: "index_funcionarios_on_pessoa_id"
  end

  create_table "pessoas", force: :cascade do |t|
    t.string "nome"
    t.string "rua"
    t.string "bairro"
    t.string "sexo"
    t.string "telefone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_exercicios", force: :cascade do |t|
    t.string "descricaoExercicio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "treinos", force: :cascade do |t|
    t.integer "aluno_id"
    t.integer "funcionario_id"
    t.integer "tipo_exercicio_id"
    t.date "dataTreino"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aluno_id"], name: "index_treinos_on_aluno_id"
    t.index ["funcionario_id"], name: "index_treinos_on_funcionario_id"
    t.index ["tipo_exercicio_id"], name: "index_treinos_on_tipo_exercicio_id"
  end

end
