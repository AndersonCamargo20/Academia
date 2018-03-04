class ContasPagar < ApplicationRecord
	belongs_to :fornecedor
	validates :valor, presence: true, numericality: {only_float: true}
	validates :data_pagamento, presence: true
end
