class UserStorySerializer < ActiveModel::Serializer
  attributes :id
  has_one :user
  has_one :storyStage
end
