class CreateTipoExercicios < ActiveRecord::Migration[5.1]
  def change
    create_table :tipo_exercicios do |t|
      t.string :descricaoExercicio

      t.timestamps
    end
  end
end
