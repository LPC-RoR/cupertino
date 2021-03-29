class Curriculum < ApplicationRecord
	belongs_to :nivel_base
	belongs_to :asignatura_nivel_base, optional: true
end
