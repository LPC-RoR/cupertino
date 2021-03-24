class ItemBase < ApplicationRecord

	TABLA_FIELDS = [
		['orden',   'normal'],
		['item_base', 'show'],
		['pagina']
	]

	# -------------------- FORM  -----------------------
 	FORM_FIELDS = [
 		['orden',     'entry'],
		['item_base', 'entry'],
		['pagina',    'entry']
	]

	belongs_to :documento_base
end
