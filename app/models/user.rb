class User < ApplicationRecord
  has_many :user_stories
  has_many :story_stages, through: :user_stories
end
