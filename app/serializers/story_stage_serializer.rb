class StoryStageSerializer < ActiveModel::Serializer
  attributes :id, :stage, :body, :button, :nextStep, :description, :pic_id
end
