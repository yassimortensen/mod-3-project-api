class CreatePics < ActiveRecord::Migration[5.1]
  def change
    create_table :pics do |t|
      t.string :picUrl

      t.timestamps
    end
  end
end
