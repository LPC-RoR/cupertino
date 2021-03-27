class Curriculum < ApplicationRecord
	belongs_to :nivel_base
	belongs_to :tipo_asignatura_base, optional: true
	belongs_to :asignatura_nivel_base, optional: true
end
