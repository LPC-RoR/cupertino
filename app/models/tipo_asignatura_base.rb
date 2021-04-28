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

	has_many :asignatura_nivel_bases
end
