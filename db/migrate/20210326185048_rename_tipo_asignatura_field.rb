class RenameTipoAsignaturaField < ActiveRecord::Migration[5.2]
  def change
	rename_column :tipo_asignatura_bases, :tipo_asignatura, :tipo_asignatura_base
  end
end
