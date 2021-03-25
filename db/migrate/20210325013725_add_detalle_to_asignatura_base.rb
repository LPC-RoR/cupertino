class AddDetalleToAsignaturaBase < ActiveRecord::Migration[5.2]
  def change
    add_column :asignatura_bases, :detalle, :text
  end
end
