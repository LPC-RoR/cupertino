class DocumentoBase < ApplicationRecord
	TABLA_FIELDS = [
		['orden',   'normal'],
		['documento_base', 'show']
	]

	# -------------------- FORM  -----------------------
 	FORM_FIELDS = [
 		['orden',     'entry'],
		['documento_base', 'entry']
	]

	belongs_to :area_base

	has_many :referencias
	has_many :asignatura_bases, through: :referencias

	has_many :nivel_bases, through: :referencias
end
