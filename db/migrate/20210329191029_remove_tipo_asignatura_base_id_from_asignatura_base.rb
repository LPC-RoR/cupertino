class RemoveTipoAsignaturaBaseIdFromAsignaturaBase < ActiveRecord::Migration[5.2]
  def change
    remove_column :asignatura_bases, :tipo_asignatura_base_id, :integer
  end
end
