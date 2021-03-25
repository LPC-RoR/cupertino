class CurriculumBase < ApplicationRecord
	TABLA_FIELDS = [
		['orden',   'normal'],
		['curriculum_base', 'show']
	]

	# -------------------- FORM  -----------------------
 	FORM_FIELDS = [
 		['orden',        'entry'],
		['curriculum_base',   'entry']
	]

	has_many :nivel_bases
	has_many :asignatura_bases

end
