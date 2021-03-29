class CreateReferenciaBases < ActiveRecord::Migration[5.2]
  def change
    create_table :referencia_bases do |t|
      t.string :referencia_base
      t.string :tipo_referencia_base_id
      t.string :seccion

      t.timestamps
    end
  end
end
