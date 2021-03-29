class CreateCitas < ActiveRecord::Migration[5.2]
  def change
    create_table :citas do |t|
      t.integer :referencia_base_id
      t.integer :documento_base_id

      t.timestamps
    end
    add_index :citas, :referencia_base_id
    add_index :citas, :documento_base_id
  end
end
