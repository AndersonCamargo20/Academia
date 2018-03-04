class AddValorToContasRecebers < ActiveRecord::Migration[5.1]
  def change
    add_column :contas_recebers, :valor, :float
  end
end
