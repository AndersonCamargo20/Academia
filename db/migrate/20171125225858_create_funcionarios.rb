class CreateFuncionarios < ActiveRecord::Migration[5.1]
  def change
    create_table :funcionarios do |t|
      t.references :pessoa, foreign_key: true
      t.references :cargo, foreign_key: true
      t.float :salario
      t.date :dataContratacao

      t.timestamps
    end
  end
end
