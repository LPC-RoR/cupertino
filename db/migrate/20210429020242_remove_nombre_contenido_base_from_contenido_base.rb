class RemoveNombreContenidoBaseFromContenidoBase < ActiveRecord::Migration[5.2]
  def change
    remove_column :contenido_bases, :nombre_contenido_base, :string
  end
end
