class NivelBase < ApplicationRecord
	TABLA_FIELDS = [
		['orden',   'normal'],
		['nivel_base', 'show']
	]

	# -------------------- FORM  -----------------------
 	FORM_FIELDS = [
 		['orden',               'entry'],
		['nivel_base',          'entry'],
#		['primer_nivel',    'check_box'],
		['curriculum_base_id', 'hidden']
	]

	belongs_to :curriculum_base

	has_one  :parent_relation, :foreign_key => "child_id", :class_name => "Requisito"
	has_many :child_relations, :foreign_key => "parent_id", :class_name => "Requisito"

	has_one  :parent, :through => :parent_relation
	has_many :children, :through => :child_relations, :source => :child

	has_many :curriculums
	has_many :asignatura_nivel_bases, through: :curriculums

	def n_anbs_con_herencia
		self.asignatura_nivel_bases.count + (self.parent.present? ? self.parent.asignatura_nivel_bases.count : 0)
	end

	def anbs_con_herencia(tipo)
		anb_ids = self.asignatura_nivel_bases.map {|anb| anb.id if anb.asignatura_base.tipo == tipo}.compact
		parent_anb_ids = (self.parent.present? ? self.parent.asignatura_nivel_bases.map {|anb| anb.id if anb.asignatura_base.tipo == tipo}.compact : [])
		AsignaturaNivelBase.where(id: anb_ids.union(parent_anb_ids))
	end

end
