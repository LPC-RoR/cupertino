class CreateTipoAsignaturaBases < ActiveRecord::Migration[5.2]
  def change
    create_table :tipo_asignatura_bases do |t|
      t.integer :orden
      t.string :tipo_asignatura
      t.integer :curriculum_base_id

      t.timestamps
    end
    add_index :tipo_asignatura_bases, :orden
    add_index :tipo_asignatura_bases, :curriculum_base_id
  end
end
