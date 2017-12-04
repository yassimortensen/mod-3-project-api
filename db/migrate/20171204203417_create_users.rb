class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :characterName
      t.string :favFood
      t.string :firstJob
      t.string :favAnimal

      t.timestamps
    end
  end
end
