class CreateContenidoBases < ActiveRecord::Migration[5.2]
  def change
    create_table :contenido_bases do |t|
      t.integer :asignatura_nivel_base_id
      t.string :contenido_base

      t.timestamps
    end
    add_index :contenido_bases, :asignatura_nivel_base_id
  end
end
