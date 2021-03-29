class AddTipoAsignaturaBaseIdToAsignaturaNivelBase < ActiveRecord::Migration[5.2]
  def change
    add_column :asignatura_nivel_bases, :tipo_asignatura_base, :integer
    add_index :asignatura_nivel_bases, :tipo_asignatura_base
  end
end
