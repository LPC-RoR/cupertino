class CreateCurriculumBases < ActiveRecord::Migration[5.2]
  def change
    create_table :curriculum_bases do |t|
      t.integer :orden
      t.string :curriculum_base

      t.timestamps
    end
    add_index :curriculum_bases, :orden
  end
end
