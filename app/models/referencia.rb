class Referencia < ApplicationRecord
	belongs_to :nivel_base, optional: true
	belongs_to :asignatura_base, optional: true
	belongs_to :documento_base
end
