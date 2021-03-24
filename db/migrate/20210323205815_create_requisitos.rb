class CreateRequisitos < ActiveRecord::Migration[5.2]
  def change
    create_table :requisitos do |t|
      t.integer :parent_id
      t.integer :child_id

      t.timestamps
    end
    add_index :requisitos, :parent_id
    add_index :requisitos, :child_id
  end
end
