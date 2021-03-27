class TipoAsignaturaBase < ApplicationRecord

	TABLA_FIELDS = [
		['orden',   'normal'],
		['tipo_asignatura_base', 'show']
	]

	# -------------------- FORM  -----------------------
 	FORM_FIELDS = [
 		['orden',                'entry'],
		['tipo_asignatura_base', 'entry'],
		['curriculum_base_id',  'hidden']
	]

	belongs_to :curriculum_base

	has_many :asignatura_bases

	has_many :curriculums
	has_many :nivel_bases, through: :curriculums
	
end
