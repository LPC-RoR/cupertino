class CreateAreaBases < ActiveRecord::Migration[5.2]
  def change
    create_table :area_bases do |t|
      t.integer :orden
      t.string :area_base

      t.timestamps
    end
    add_index :area_bases, :orden
  end
end
