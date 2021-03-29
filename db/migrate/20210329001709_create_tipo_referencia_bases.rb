class CreateTipoReferenciaBases < ActiveRecord::Migration[5.2]
  def change
    create_table :tipo_referencia_bases do |t|
      t.integer :orden
      t.string :tipo_referencia_base

      t.timestamps
    end
    add_index :tipo_referencia_bases, :orden
  end
end
