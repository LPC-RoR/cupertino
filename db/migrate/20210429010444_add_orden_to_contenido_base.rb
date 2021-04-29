class AddOrdenToContenidoBase < ActiveRecord::Migration[5.2]
  def change
    add_column :contenido_bases, :orden, :integer
    add_index :contenido_bases, :orden
  end
end
