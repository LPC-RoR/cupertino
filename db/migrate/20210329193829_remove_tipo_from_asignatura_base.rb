class RemoveTipoFromAsignaturaBase < ActiveRecord::Migration[5.2]
  def change
    remove_column :asignatura_bases, :tipo, :string
    remove_column :asignatura_bases, :alcance, :string
  end
end
