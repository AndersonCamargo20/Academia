class CreatePessoas < ActiveRecord::Migration[5.1]
  def change
    create_table :pessoas do |t|
      t.string :nome
      t.string :rua
      t.string :bairro
      t.string :sexo
      t.string :telefone
      t.string :email

      t.timestamps
    end
  end
end
