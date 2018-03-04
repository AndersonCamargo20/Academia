class CreateContasRecebers < ActiveRecord::Migration[5.1]
  def change
    create_table :contas_recebers do |t|
      t.references :aluno, foreign_key: true
      t.date :data_recebimento
      t.boolean :pago

      t.timestamps
    end
  end
end
