class RemoveTipoAsignaturaBaseFromCurriculum < ActiveRecord::Migration[5.2]
  def change
    remove_column :curriculums, :tipo_asignatura_base_id, :integer
  end
end
