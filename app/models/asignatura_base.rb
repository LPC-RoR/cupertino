class AsignaturaBase < ApplicationRecord

	TABLA_FIELDS = [
		['asignatura_base', 'show']
	]

	# -------------------- FORM  -----------------------
 	FORM_FIELDS = [
		['asignatura_base', 'entry']
	]

	has_many :curriculums
	has_many :nivel_bases, through: :curriculums

	has_many :referencias
	has_many :documento_bases, through: :referencias
end