class RemoveAlcanceFromAsignaturaNivelBase < ActiveRecord::Migration[5.2]
  def change
    remove_column :asignatura_nivel_bases, :alcance, :string
  end
end
