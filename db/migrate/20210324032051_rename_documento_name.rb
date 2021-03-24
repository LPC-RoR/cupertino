class RenameDocumentoName < ActiveRecord::Migration[5.2]
  def change
	rename_column :documento_bases, :documento, :documento_base
  end
end
