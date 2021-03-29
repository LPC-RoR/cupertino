class Cita < ApplicationRecord
	belongs_to :referencia_base
	belongs_to :documento_base
end
