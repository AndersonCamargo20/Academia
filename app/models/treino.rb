class Treino < ApplicationRecord
  belongs_to :aluno
  belongs_to :funcionario
  belongs_to :tipo_exercicio

  
end
