class TipoExercicio < ApplicationRecord
	validates :descricaoExercicio, presence: true, length: { maximum: 50 }
end
