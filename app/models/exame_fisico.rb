class ExameFisico < ApplicationRecord
  belongs_to :aluno 
  belongs_to :funcionario

  validates :peso, :altura, :imc, :busto, :cintura, presence: true, numericality: true

end
