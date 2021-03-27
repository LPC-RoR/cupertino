class AddTipoAsignaturaBaseIdToAsignaturaBase < ActiveRecord::Migration[5.2]
  def change
    add_column :asignatura_bases, :tipo_asignatura_base_id, :integer
    add_index :asignatura_bases, :tipo_asignatura_base_id
  end
end
