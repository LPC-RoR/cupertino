class AddAsignaturaBaseIdToCurriculum < ActiveRecord::Migration[5.2]
  def change
    add_column :curriculums, :tipo_asignatura_base_id, :integer
    add_index :curriculums, :tipo_asignatura_base_id
  end
end
