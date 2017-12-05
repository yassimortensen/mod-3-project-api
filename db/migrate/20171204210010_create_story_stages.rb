class CreateStoryStages < ActiveRecord::Migration[5.1]
  def change
    create_table :story_stages do |t|
      t.string :stage
      t.string :body
      t.string :button
      t.string :nextStep
      t.string :description
      t.integer :pic_id

      t.timestamps
    end
  end
end
