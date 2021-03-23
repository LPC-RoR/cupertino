class CreateConversaciones < ActiveRecord::Migration[5.2]
  def change
    create_table :conversaciones do |t|
      t.integer :parent_id
      t.integer :child_id

      t.timestamps
    end
    add_index :conversaciones, :parent_id
    add_index :conversaciones, :child_id
  end
end
