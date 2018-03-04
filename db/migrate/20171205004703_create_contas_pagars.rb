class CreateContasPagars < ActiveRecord::Migration[5.1]
  def change
    create_table :contas_pagars do |t|
      t.string :descricao
      t.float :valor
      t.date :data_pagamento
      t.boolean :pago

      t.timestamps
    end
  end
end
