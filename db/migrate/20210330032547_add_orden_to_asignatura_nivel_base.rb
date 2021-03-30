class AddOrdenToAsignaturaNivelBase < ActiveRecord::Migration[5.2]
  def change
    add_column :asignatura_nivel_bases, :orden, :integer
    add_index :asignatura_nivel_bases, :orden
  end
end
