class TipoReferenciaBase < ApplicationRecord
	TABLA_FIELDS = [
		['orden',   'normal'],
		['tipo_referencia_base', 'show']
	]

	# -------------------- FORM  -----------------------
 	FORM_FIELDS = [
 		['orden',     'entry'],
		['tipo_referencia_base', 'entry']
	]

	has_many :referencia_bases
end
