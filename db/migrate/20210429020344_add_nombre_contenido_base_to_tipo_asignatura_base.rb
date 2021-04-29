class AddNombreContenidoBaseToTipoAsignaturaBase < ActiveRecord::Migration[5.2]
  def change
    add_column :tipo_asignatura_bases, :nombre_contenido_base, :string
  end
end
