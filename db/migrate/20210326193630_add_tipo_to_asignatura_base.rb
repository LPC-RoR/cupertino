class AddTipoToAsignaturaBase < ActiveRecord::Migration[5.2]
  def change
    add_column :asignatura_bases, :tipo, :string
    add_index :asignatura_bases, :tipo
  end
end
