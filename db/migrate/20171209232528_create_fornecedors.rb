class CreateFornecedors < ActiveRecord::Migration[5.1]
  def change
    create_table :fornecedors do |t|
      t.string :nome
      t.string :cidade
      t.string :bairro
      t.string :rua
      t.boolean :ativo
      t.string :tipo

      t.timestamps
    end
  end
end
