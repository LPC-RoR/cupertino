class CreateCoberturas < ActiveRecord::Migration[5.2]
  def change
    create_table :coberturas do |t|
      t.integer :asignatura_base_id
      t.integer :tipo_asignatura_base_id

      t.timestamps
    end
    add_index :coberturas, :asignatura_base_id
    add_index :coberturas, :tipo_asignatura_base_id
  end
end
