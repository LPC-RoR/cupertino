class RenameAsignaturaIdToCurriculum < ActiveRecord::Migration[5.2]
  def change
	rename_column :curriculums, :asignatura_base_id, :asignatura_nivel_base_id
  end
end
