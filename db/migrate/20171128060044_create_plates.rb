class CreatePlates < ActiveRecord::Migration[5.1]
  def change
    create_table :plates do |t|
      t.integer :weight
      t.references :dinner, foreign_key: true

      t.timestamps
    end
  end
end
