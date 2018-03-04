class Pessoa < ApplicationRecord
	validates :nome, :rua, length: { in: 5..30 }
	validates :bairro, length: { in: 5..20 }
	validates :telefone, length: { in: 10..12 }, numericality: { only_integer: true }
	validates :email,  length: { maximum: 50 }
end
