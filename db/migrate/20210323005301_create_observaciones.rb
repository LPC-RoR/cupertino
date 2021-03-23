class CreateObservaciones < ActiveRecord::Migration[5.2]
  def change
    create_table :observaciones do |t|
      t.string :observacion
      t.text :detalle

      t.timestamps
    end
  end
end
