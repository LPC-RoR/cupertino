class AddPrimerNivelToNivelBase < ActiveRecord::Migration[5.2]
  def change
    add_column :nivel_bases, :primer_nivel, :boolean
    add_index :nivel_bases, :primer_nivel
  end
end
