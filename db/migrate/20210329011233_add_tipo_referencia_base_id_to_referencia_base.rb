class AddTipoReferenciaBaseIdToReferenciaBase < ActiveRecord::Migration[5.2]
  def change
    add_column :referencia_bases, :clave, :string

    add_index :referencia_bases, :tipo_referencia_base_id
    add_index :referencia_bases, :clave
  end
end
