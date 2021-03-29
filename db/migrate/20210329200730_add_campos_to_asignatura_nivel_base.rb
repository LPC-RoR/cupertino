class AddCamposToAsignaturaNivelBase < ActiveRecord::Migration[5.2]
  def change
    add_column :asignatura_nivel_bases, :origen, :string
    add_column :asignatura_nivel_bases, :tipo, :string
    add_column :asignatura_nivel_bases, :alcance, :string
  end
end
