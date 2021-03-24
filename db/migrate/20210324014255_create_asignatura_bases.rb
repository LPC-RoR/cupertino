class CreateAsignaturaBases < ActiveRecord::Migration[5.2]
  def change
    create_table :asignatura_bases do |t|
      t.string :asignatura

      t.timestamps
    end
  end
end
