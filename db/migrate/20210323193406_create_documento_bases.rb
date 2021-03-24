class CreateDocumentoBases < ActiveRecord::Migration[5.2]
  def change
    create_table :documento_bases do |t|
      t.integer :orden
      t.string :documento
      t.integer :area_base_id

      t.timestamps
    end
    add_index :documento_bases, :orden
    add_index :documento_bases, :area_base_id
  end
end
