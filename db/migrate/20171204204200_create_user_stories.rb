class CreateUserStories < ActiveRecord::Migration[5.1]
  def change
    create_table :user_stories do |t|
      t.integer :user_id
      t.integer :story_stage_id

      t.timestamps
    end
  end
end
