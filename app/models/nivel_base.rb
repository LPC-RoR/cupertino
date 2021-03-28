class NivelBase < ApplicationRecord
	TABLA_FIELDS = [
		['orden',   'normal'],
		['nivel_base', 'show']
	]

	# -------------------- FORM  -----------------------
 	FORM_FIELDS = [
 		['orden',               'entry'],
		['nivel_base',          'entry'],
		['primer_nivel',    'check_box'],
		['curriculum_base_id', 'hidden']
	]

	belongs_to :curriculum_base

	has_one  :parent_relation, :foreign_key => "child_id", :class_name => "Requisito"
	has_many :child_relations, :foreign_key => "parent_id", :class_name => "Requisito"

	has_one  :parent, :through => :parent_relation
	has_many :children, :through => :child_relations, :source => :child

	has_many :curriculums
	has_many :asignatura_nivel_bases, through: :curriculums
	has_many :tipo_asignatura_bases, through: :curriculums

	has_many :referencias
	has_many :documento_bases, through: :referencias

	def n_anbs_con_herencia
		self.asignatura_nivel_bases.count + (self.parent.present? ? self.parent.asignatura_nivel_bases.count : 0)
	end

	def anbs_con_herencia
		self.parent.present? ? AsignaturaNivelBase.where(id: self.asignatura_nivel_bases.ids.union(self.parent.asignatura_nivel_bases.ids)) : self.asignatura_nivel_bases
	end

end
