class AsignaturaNivelBase < ApplicationRecord

	TABLA_FIELDS = [
		['d_asignatura_nivel', 'show']
	]

	belongs_to :asignatura_base

	has_many :curriculums
	has_many :nivel_bases, through: :curriculums

	def d_asignatura_nivel
		"#{self.asignatura_base.asignatura_base}#{' : ' if self.nivel_bases.any?}#{self.nivel_bases.map {|nb| nb.nivel_base}.join(' & ')}"
	end

end
