class CreateUserStories < ActiveRecord::Migration[5.1]
  def change
    create_table :user_stories do |t|
      t.integer :userId
      t.integer :storyStageId

      t.timestamps
    end
  end
end
