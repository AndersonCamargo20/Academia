class CreateExameFisicos < ActiveRecord::Migration[5.1]
  def change
    create_table :exame_fisicos do |t|
      t.references :aluno, foreign_key: true
      t.references :funcionario, foreign_key: true
      t.date :dataExame
      t.float :peso
      t.float :altura
      t.float :imc
      t.float :busto
      t.float :cintura

      t.timestamps
    end
  end
end
