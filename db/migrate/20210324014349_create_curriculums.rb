class CreateCurriculums < ActiveRecord::Migration[5.2]
  def change
    create_table :curriculums do |t|
      t.integer :nivel_base_id
      t.integer :asignatura_base_id

      t.timestamps
    end
    add_index :curriculums, :nivel_base_id
    add_index :curriculums, :asignatura_base_id
  end
end
