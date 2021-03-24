class CreateReferencias < ActiveRecord::Migration[5.2]
  def change
    create_table :referencias do |t|
      t.integer :nivel_base_id
      t.integer :asignatura_base_id
      t.integer :documento_base_id

      t.timestamps
    end
    add_index :referencias, :nivel_base_id
    add_index :referencias, :asignatura_base_id
    add_index :referencias, :documento_base_id
  end
end
