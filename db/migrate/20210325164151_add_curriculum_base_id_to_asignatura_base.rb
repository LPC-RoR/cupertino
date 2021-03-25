class AddCurriculumBaseIdToAsignaturaBase < ActiveRecord::Migration[5.2]
  def change
    add_column :asignatura_bases, :curriculum_base_id, :integer
    add_index :asignatura_bases, :curriculum_base_id
  end
end
