class AddCurriculumBaseIdToNivelBase < ActiveRecord::Migration[5.2]
  def change
    add_column :nivel_bases, :curriculum_base_id, :integer
    add_index :nivel_bases, :curriculum_base_id
  end
end
