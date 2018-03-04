class CreateTreinos < ActiveRecord::Migration[5.1]
  def change
    create_table :treinos do |t|
      t.references :aluno, foreign_key: true
      t.references :funcionario, foreign_key: true
      t.references :tipo_exercicio, foreign_key: true
      t.date :dataTreino

      t.timestamps
    end
  end
end
