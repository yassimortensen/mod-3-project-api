class CreateUserStories < ActiveRecord::Migration[5.1]
  def change
    create_table :user_stories do |t|
      t.references :user, foreign_key: true
      t.references :storyStage, foreign_key: true

      t.timestamps
    end
  end
end
