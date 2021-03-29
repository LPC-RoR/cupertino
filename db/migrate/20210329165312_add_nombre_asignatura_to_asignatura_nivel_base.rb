class AddNombreAsignaturaToAsignaturaNivelBase < ActiveRecord::Migration[5.2]
  def change
    add_column :asignatura_nivel_bases, :nombre_asignatura, :string
  end
end
