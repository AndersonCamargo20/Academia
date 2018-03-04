class ContasReceber < ApplicationRecord
  belongs_to :aluno
  validates :valor, presence: true, numericality: {only_float: true}
end
