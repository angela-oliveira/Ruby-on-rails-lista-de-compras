class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :nome
      t.float :preco
      t.integer :quantidade

      t.timestamps
    end
  end
end
