class ReferenciaBase < ApplicationRecord
	belongs_to :tipo_referencia_base

	has_many :citas
	has_many :documento_bases, through: :citas
end
