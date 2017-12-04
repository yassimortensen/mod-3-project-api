class User < ApplicationRecord
  has_many :user_stories
  has_many :storyStages, through: :user_stories
end
