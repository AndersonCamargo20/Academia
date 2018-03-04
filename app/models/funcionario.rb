class Funcionario < ApplicationRecord
  belongs_to :pessoa, dependent: :destroy
  belongs_to :cargo
  accepts_nested_attributes_for :pessoa, :update_only => true
  validates :salario, length: { maximum:10 }, numericality: { only_float: true }
  
end
