class AddFornecedorToContasPagar < ActiveRecord::Migration[5.1]
  def change
    add_reference :contas_pagars, :fornecedor, foreign_key: {on_delete: :cascade}
  end
end
