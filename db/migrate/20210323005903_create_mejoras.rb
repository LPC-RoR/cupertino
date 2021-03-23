class CreateMejoras < ActiveRecord::Migration[5.2]
  def change
    create_table :mejoras do |t|
      t.string :mejora
      t.text :detalle
      t.integer :owner_id

      t.timestamps
    end
    add_index :mejoras, :owner_id
  end
end
