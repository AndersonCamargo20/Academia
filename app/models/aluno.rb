class Aluno < ApplicationRecord
	belongs_to :pessoa, dependent: :destroy
 	validates :matricula, presence: true

 	accepts_nested_attributes_for :pessoa, :update_only => true
end
