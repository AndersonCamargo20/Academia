class CreateAlunos < ActiveRecord::Migration[5.1]
  def change
    create_table :alunos do |t|
      t.references :pessoa, foreign_key: true
      t.boolean :ativo
      t.string :matricula

      t.timestamps
    end
  end
end
