class RenameTipoAsignaturaIdToAsignaturaNivelBase < ActiveRecord::Migration[5.2]
  def change
  	rename_column :asignatura_nivel_bases, :tipo_asignatura_base, :tipo_asignatura_base_id
  end
end
