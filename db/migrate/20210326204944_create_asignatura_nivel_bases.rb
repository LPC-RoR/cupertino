class CreateAsignaturaNivelBases < ActiveRecord::Migration[5.2]
  def change
    create_table :asignatura_nivel_bases do |t|
      t.integer :asignatura_base_id

      t.timestamps
    end
    add_index :asignatura_nivel_bases, :asignatura_base_id
  end
end
