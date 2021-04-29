class AddNombreContenidoBaseToContenidoBase < ActiveRecord::Migration[5.2]
  def change
    add_column :contenido_bases, :nombre_contenido_base, :string
  end
end
