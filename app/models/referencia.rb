class Referencia < ApplicationRecord
	belongs_to :asignatura_nivel_base, optional: true
	belongs_to :asignatura_base, optional: true
	belongs_to :documento_base
end
