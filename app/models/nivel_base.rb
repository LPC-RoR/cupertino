class NivelBase < ApplicationRecord
	TABLA_FIELDS = [
		['orden',   'normal'],
		['nivel_base', 'show']
	]

	# -------------------- FORM  -----------------------
 	FORM_FIELDS = [
 		['orden',        'entry'],
		['nivel_base',   'entry'],
		['primer_nivel', 'check_box']
	]

	has_one  :parent_relation, :foreign_key => "child_id", :class_name => "Requisito"
	has_many :child_relations, :foreign_key => "parent_id", :class_name => "Requisito"

	has_one  :parent, :through => :parent_relation
	has_many :children, :through => :child_relations, :source => :child

	has_many :curriculums
	has_many :asignatura_bases, through: :curriculums

	has_many :referencias
	has_many :documento_bases, through: :referencias

end