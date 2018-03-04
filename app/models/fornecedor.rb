class Fornecedor < ApplicationRecord
	validates :bairro, :cidade, :rua, :nome, :tipo, presence: true
end
