class UserStory < ApplicationRecord
  belongs_to :user
  belongs_to :storyStage
end
