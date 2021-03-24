class RenameAsignaturaName < ActiveRecord::Migration[5.2]
  def change
	rename_column :asignatura_bases, :asignatura, :asignatura_base
  end
end
