class AddLinkToDocumentoBase < ActiveRecord::Migration[5.2]
  def change
    add_column :documento_bases, :link, :string
  end
end
