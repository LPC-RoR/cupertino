class ContenidoBase < ApplicationRecord
	TABLA_FIELDS = [
		['contenido_base', 'show']
	]

	# -------------------- FORM  -----------------------
 	FORM_FIELDS = [
		['contenido_base',            'entry'],
		['asignatura_nivel_base_id', 'hidden']
	]

	belongs_to :asignatura_nivel_base
end
