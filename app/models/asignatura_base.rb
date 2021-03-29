class AsignaturaBase < ApplicationRecord

	TIPO = ['base', 'electivo', 'libre disposición']
	ALCANCE = ['nivel', 'multinivel']

	TABLA_FIELDS = [
		['d_asignatura', 'show'],
		['d_niveles',  'normal']
	]

	# -------------------- FORM  -----------------------
 	FORM_FIELDS = [
		['asignatura_base',          'entry'],
		['detalle',              'text_area'],
		['curriculum_base_id',      'hidden'],
		['tipo_asignatura_base_id', 'hidden']
	]

	belongs_to :curriculum_base
	belongs_to :tipo_asignatura_base

	has_many :asignatura_nivel_bases

	has_many :referencias
	has_many :documento_bases, through: :referencias

	def d_detalle
	  self.detalle.blank? ? '' : self.detalle.gsub(/\n/, '<br>')
	end

	def d_asignatura
		tipo = (self.tipo == 'base' or self.tipo.blank?) ? '' : self.tipo
		alcance = (self.alcance == 'nivel' or self.alcance.blank?) ? '' : '+'
		nota = tipo+alcance
		self.asignatura_base+(nota == '' ? '' : " : #{nota}")
	end

	def status
		"[ #{self.tipo.blank? ? '' : self.tipo} : #{self.alcance.blank? ? '' : self.alcance} ]"
	end

	def d_niveles
		self.asignatura_nivel_bases.count
	end
end
