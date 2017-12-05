class CreateStoryStages < ActiveRecord::Migration[5.1]
  def change
    create_table :story_stages do |t|
      t.integer :stage
      t.text :body
      t.string :button
      t.integer :nextStep
      t.string :description
      t.integer :pic_id

      t.timestamps
    end
  end
end
