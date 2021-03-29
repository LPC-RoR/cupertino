class AsignaturaNivelBase < ApplicationRecord

	TIPO = ['base', 'electivo', 'libre disposición']
	ALCANCE = ['nivel', 'multinivel']

	TABLA_FIELDS = [
		['d_asignatura', 'show'],
		['tipo', 'normal'],
		['d_nivel',    'normal']
	]

	belongs_to :tipo_asignatura_base
	belongs_to :asignatura_base

	has_many :curriculums
	has_many :nivel_bases, through: :curriculums

	has_many :referencias
	has_many :documento_bases, through: :referencias

	def d_asignatura_nivel
		"#{self.asignatura_base.asignatura_base}#{' : ' if self.nivel_bases.any?}#{self.nivel_bases.map {|nb| nb.nivel_base}.join(' & ')}"
	end

	def d_asignatura
		self.asignatura_nivel_base.present? ? self.asignatura_nivel_base : self.asignatura_base.asignatura_base
	end

	def status
		"#{self.origen} : #{self.tipo} : #{self.tipo_asignatura_base.tipo_asignatura_base}"
	end

	def d_nivel
		self.nivel_bases.any? ? self.nivel_bases.map {|nb| nb.nivel_base}.join(' & ') : ""
	end

end
