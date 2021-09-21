class CreateLista < ActiveRecord::Migration[6.1]
  def change
    create_table :lista do |t|
      t.string :nome

      t.timestamps
    end
  end
end
