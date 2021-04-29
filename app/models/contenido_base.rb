class ContenidoBase < ApplicationRecord
	TABLA_FIELDS = [
		['orden',        'normal'],
		['contenido_base', 'show']
	]

	# -------------------- FORM  -----------------------
 	FORM_FIELDS = [
		['orden',                     'entry'],
		['contenido_base',            'entry'],
		['asignatura_nivel_base_id', 'hidden']
	]

	belongs_to :asignatura_nivel_base
end
