class AddAlcanceToAsignaturaBase < ActiveRecord::Migration[5.2]
  def change
    add_column :asignatura_bases, :alcance, :string
    add_index :asignatura_bases, :alcance
  end
end
