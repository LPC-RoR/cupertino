class Requisito < ApplicationRecord
  belongs_to :parent, :class_name => "NivelBase", :inverse_of => :parent_relation
  belongs_to :child, :class_name => "NivelBase", :inverse_of => :child_relations
end
