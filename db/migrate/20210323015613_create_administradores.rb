class CreateAdministradores < ActiveRecord::Migration[5.2]
  def change
    create_table :administradores do |t|
      t.string :administrador
      t.string :email

      t.timestamps
    end
    add_index :administradores, :email
  end
end
