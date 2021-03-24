class AreaBase < ApplicationRecord
	TABLA_FIELDS = [
		['orden',   'normal'],
		['area_base', 'show']
	]

	# -------------------- FORM  -----------------------
 	FORM_FIELDS = [
 		['orden',     'entry'],
		['area_base', 'entry']
	]

	has_many :documento_bases
end
