class CreateNivelBases < ActiveRecord::Migration[5.2]
  def change
    create_table :nivel_bases do |t|
      t.integer :orden
      t.string :nivel_base

      t.timestamps
    end
    add_index :nivel_bases, :orden
  end
end
