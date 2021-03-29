class RenameNombreAsignaturaToAsignaturaNivelBase < ActiveRecord::Migration[5.2]
  def change
  	rename_column :asignatura_nivel_bases, :nombre_asignatura, :asignatura_nivel_base
  end
end
