class AsignaturaBase < ApplicationRecord

	TABLA_FIELDS = [
		['asignatura_base', 'show']
	]

	# -------------------- FORM  -----------------------
 	FORM_FIELDS = [
		['asignatura_base',     'entry'],
		['detalle',         'text_area'],
		['curriculum_base_id', 'hidden']
	]

	belongs_to :curriculum_base

	has_many :curriculums
	has_many :nivel_bases, through: :curriculums

	has_many :referencias
	has_many :documento_bases, through: :referencias

	def d_detalle
	  self.detalle.blank? ? '' : self.detalle.gsub(/\n/, '<br>')
	end
end
