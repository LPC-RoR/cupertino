class CreateItemBases < ActiveRecord::Migration[5.2]
  def change
    create_table :item_bases do |t|
      t.integer :orden
      t.string :item_base
      t.string :pagina
      t.integer :documento_base_id

      t.timestamps
    end
    add_index :item_bases, :documento_base_id
  end
end
