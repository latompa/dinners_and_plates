class CreateDinners < ActiveRecord::Migration[5.1]
  def change
    create_table :dinners do |t|

      t.timestamps
    end
  end
end
